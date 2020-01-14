#!/bin/sh                                        #
# Description: OCS script                        #
# Copyright (C) 2015 - 2020 Jo <bash@zxx.sh>     #
# Thanks: LookBack <bash@zxx.sh>                 #
# URL: http://zxx.sh                             #
##################################################


#1安装BBR 锐速
bbr_ruisu(){
 wget -N --no-check-certificate https://raw.githubusercontent.com/veip007/Linux-NetSpeed/master/tcp.sh && chmod +x tcp.sh && bash tcp.sh
}
#2谷歌 BBR2 BBRV2
Google_bbr2(){
 wget -N --no-check-certificate https://raw.githubusercontent.com/yeyingorg/bbr2.sh/master/bbr2.sh && chmod +x bbr2.sh && bash bbr2.sh
}
#3安装KCPtun
Kcptun(){
 wget -N --no-check-certificate https://github.com/veip007/Kcptun/raw/master/kcptun/kcptun.sh && chmod +x kcptun.sh && bash kcptun.sh
}
#4安装SSR多用户版
Install_ssr(){
 wget -N --no-check-certificate https://raw.githubusercontent.com/veip007/doubi/master/ssrmu.sh && chmod +x ssrmu.sh && bash ssrmu.sh
}
#5安装V2ary_233一键
Install_V2ray(){
 wget -N --no-check-certificate https://raw.githubusercontent.com/veip007/v2ray/master/v2.sh && chmod +x v2.sh && bash v2.sh
}
#6安装Tg专用代理
Tg_socks(){
 wget -N --no-check-certificate https://raw.githubusercontent.com/veip007/doubi/master/mtproxy_go.sh && chmod +x mtproxy_go.sh && bash mtproxy_go.sh
}
#7安装Goflyway
Install_goflyway(){
 wget -N --no-check-certificate https://git.io/goflyway.sh && chmod +x goflyway.sh && bash goflyway.sh
}
#8小鸡性能测试
View_superbench(){
 wget -N --no-check-certificate https://raw.githubusercontent.com/veip007/cesu/master/superbench.sh && chmod +x superbench.sh && bash superbench.sh
}

#9回程线路测试
View_huicheng(){
 wget -N --no-check-certificate https://raw.githubusercontent.com/veip007/huicheng/master/huicheng && chmod +x huicheng
}
#10安装云监控
Install_status(){
 wget -N --no-check-certificate https://raw.githubusercontent.com/veip007/doubi/master/status.sh && chmod +x status.sh && bash status.sh
}
#11一键DD包（OD源）
DD_OD(){
 wget -N --no-check-certificate https://raw.githubusercontent.com/veip007/dd/master/dd-od.sh && chmod +x dd-od.sh  && ./dd-od.sh
}
#12一键DD包（GD源）
DD_GD(){
 wget -N --no-check-certificate https://raw.githubusercontent.com/veip007/dd/master/dd-gd.sh && chmod +x dd-gd.sh  && ./dd-gd.sh
}


init() {
  echo && echo -e "
  +-------------------------------------------------------------+
  |                          懒人专用                            |
  |                        Auth: 张琪灵                          |
  |                      欢迎提交一键脚本                        |
  +-------------------------------------------------------------+

  ————————————
  ${Green_font_prefix} 1.${Font_color_suffix} 加速系列：Bbr系列、锐速
  ${Green_font_prefix} 2.${Font_color_suffix} 安装谷歌 BBR2 BBRV2
  ${Green_font_prefix} 3.${Font_color_suffix} 安装KCPtun
  ${Green_font_prefix} 4.${Font_color_suffix} 安装SSR多用户版
  ————————————
  ${Green_font_prefix} 5.${Font_color_suffix} 安装V2ary_233一键
  ${Green_font_prefix} 6.${Font_color_suffix} Tg专用代理（Go版）
  ${Green_font_prefix} 7.${Font_color_suffix} 安装Goflyway
  ${Green_font_prefix} 8.${Font_color_suffix} 小鸡性能测试
  ————————————
  ${Green_font_prefix} 9.${Font_color_suffix} 回程线路测试:命令:./huicheng 您的IP
  ${Green_font_prefix}10.${Font_color_suffix} 云监控
  ${Green_font_prefix}11.${Font_color_suffix} 傻瓜式一键DD包（OD源）
  ${Green_font_prefix}12.${Font_color_suffix} 傻瓜式一键DD包（GD源）
  ————————————" && echo
  echo
  read -e -p " 请输入数字 [0-12]:" num
  case "$num" in
  	0)
    esho "hello world"
    ;;
    1)
    bbr_ruisu
    ;;
  	2)
    Google_bbr2
    ;;
  	3)
    Kcptun
    ;;
  	4)
    Install_ssr
    ;;
  	5)
    Install_V2ray
    ;;
  	6)
    Tg_socks
    ;;
  	7)
    Install_goflyway
    ;;
  	8)
    View_superbench
    ;;
  	9)
    View_huicheng
    ;;
  	10)
    Install_status
    ;;
  	11)
    DD_OD
    ;;
  	12)
    DD_GD
    ;;
  	*)
    echo "请输入正确数字 [1-12]"
esac
}
init
