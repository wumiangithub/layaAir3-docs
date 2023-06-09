# chmod +x ./test.sh  #使脚本具有执行权限

echo "启动脚本"

resourceDir=./dist   #资源目录
targetDir=../UMC_PET_H5/dist  #目标路径
backResourceProjectPath=../../LAYAAIR3-DOCS    #返回资源项目目录

if [ ! -d "${targetDir}" ]; then
    echo ${targetDir}"文件不存在"
    exit;
    # else
    # echo ${targetDir}"存在"
fi

if [ ! -d "${resourceDir}" ]; then
    echo ${targetDir}"文件不存在"
    exit;
    # else
    # echo ${resourceDir}"存在"
fi



# rm -rf ${targetDir} # 删除所有包括目标文件夹    不安全不推荐
# rm -rf ${targetDir}**/*  # 删除所有不包括目标文件夹   不安全不推荐

# rm -rf `ls ${targetDir}|egrep -v '(*.html)'` # 不生效

# rm -rf `ls ${targetDir}/*|egrep -v '(*.html)'` # 只删除第一层     删除所有文件除了*.html
# rm -rf `ls ${targetDir}/**/*|egrep -v '(*.html)'` # 只删除第二层   删除所有文件除了*.html
# rm -rf `ls ${targetDir}/**/**/*|egrep -v '(*.html)'` # 只删除第三层   删除所有文件除了*.html

rm -rf ${targetDir}/*.ls  #删除第一层的ls文件
rm -rf ${targetDir}/js   
rm -rf ${targetDir}/resources
rm -rf ${targetDir}/libs

cp  -r  ${resourceDir}/*    ${targetDir}  #将resourceDir下的文件复制到targetDir

cd ${targetDir} #进入目标文件夹

current_time=`date`

time_cuo=`date '+%s'`

echo $current_time
echo $time_cuo

index_name="index"${time_cuo}".js"
bundle_name="bundle"${time_cuo}".js"

mv js/index.js js/${index_name}
mv js/bundle.js js/${bundle_name}

sed -i  "s/index.js/${index_name}/g" index.html   #改文件内容
sed -i  "s/bundle.js/${bundle_name}/g" index.html  #改文件内容

cd ${backResourceProjectPath}  #返回资源项目目录

pwd

commit_msg=$2 || $current_time

if [ $1 -a  $1 == "submit_git" ]
then
    echo "打包：提交代码"

   if [ ! $2 ]
   then
    echo "请输入git commit内容"
    exit
   fi

    git pull

    git add .

    git commit -m $commit_msg

    git push

else
    echo "打包：不提交代码"
fi
