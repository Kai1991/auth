package com.meidian;

import com.meidian.auth.utils.RedisUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.Factory;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.test.context.junit4.SpringRunner;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DemoApplicationTests {
	Logger logger = LoggerFactory.getLogger(DemoApplicationTests.class);

	@Autowired
	private JedisPool jedisPool;
	@Autowired
	private RedisUtil redisUtil;

	@Test
	public void contextLoads() {
	}

	/**
	 * 简单shiro 的校验测试
	 * 基于 shiro.ini的身份验证
	 * */
	@Test
	public void testHelloworld() {
		//1、获取SecurityManager工厂，此处使用Ini配置文件初始化SecurityManager
		Factory<SecurityManager> factory =
				new IniSecurityManagerFactory("classpath:shiro/shiro.ini");
		//2、得到SecurityManager实例 并绑定给SecurityUtils
		org.apache.shiro.mgt.SecurityManager securityManager = factory.getInstance();
		SecurityUtils.setSecurityManager(securityManager);
		//3、得到Subject及创建用户名/密码身份验证Token（即用户身份/凭证）
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken("zhang", "1234");

		try {
			//4、登录，即身份验证
			subject.login(token);
			System.out.println("登陆成功");
		} catch (AuthenticationException e) {
			//5、身份验证失败
			System.out.println("登陆失败！");
		}

		Assert.assertEquals(true, subject.isAuthenticated()); //断言用户已经登录

		//6、退出
		subject.logout();
	}

	/**
	 * single realm
	 * */
	@Test
	public void testSingleRealm() {
		//1、获取SecurityManager工厂，此处使用Ini配置文件初始化SecurityManager
		Factory<SecurityManager> factory =
				new IniSecurityManagerFactory("classpath:shiro/shiro-realm.ini");
		//2、得到SecurityManager实例 并绑定给SecurityUtils
		org.apache.shiro.mgt.SecurityManager securityManager = factory.getInstance();
		SecurityUtils.setSecurityManager(securityManager);
		//3、得到Subject及创建用户名/密码身份验证Token（即用户身份/凭证）
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken("zhang", "1234");

		try {
			//4、登录，即身份验证
			subject.login(token);
			System.out.println("登陆成功");
		} catch (AuthenticationException e) {
			//5、身份验证失败
			System.out.println("登陆失败！");
		}

		Assert.assertEquals(true, subject.isAuthenticated()); //断言用户已经登录

		//6、退出
		subject.logout();
	}


	@Test
	public void  testRedis(){
		Jedis jedis = jedisPool.getResource();
		jedis.set("Mytest","Mytest");
		logger.info("Mytest:" + jedis.get("Mytest"));
	}

	@Test
	public void testRedisUtil(){
		redisUtil.set("testtest","testtest");
		logger.info(redisUtil.getString("testtest"));
	}

}
