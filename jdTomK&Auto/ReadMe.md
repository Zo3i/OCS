本脚本仅在Centos7通过测试;

JDK版本为8,Tomcat为8.5,mysql为5.7;

### 教程

- **linux下载一键脚本:**

  ```shell
  wget https://raw.githubusercontent.com/Zo3i/OCS/master/jdTomK%26Auto/JdTomK-Auto.sh
  ```

- **执行脚本:**

  ```shell
  source JdTomK-Auto.sh
  ```

- **进入数据库:**

  ```shell
  mysql -uroot -p
  ```

- **修改数据库密码:**

  ```mysql
  ALTER USER 'root'@'localhost' IDENTIFIED BY '密码';
  ```

- **远程权限账户创建:**

  ```mysql
  grant all privileges on *.* to '用户名' @'%' identified by '密码';
  FLUSH PRIVILEGES;"
  ```

- **开启/关闭tomcat:**

  ```shell
  service tomcat start
  service tomcat stop
  ```



### 注意点

1. mysql初始化密码: 红字显示;
2. 修改密码后必须执行: FLUSH PRIVILEGES;
3. 退出mysql命令为: exit;
