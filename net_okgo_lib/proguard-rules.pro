# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in E:\android\sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

#指定代码的压缩级别
 -optimizationpasses 5
 #包明不混合大小写
 -dontusemixedcaseclassnames
 #不去忽略非公共的库类
 -dontskipnonpubliclibraryclasses
  #优化  不优化输入的类文件
 -dontoptimize
  #不做预校验
 -dontpreverify
  #混淆时是否记录日志
 -verbose
  # 混淆时所采用的算法
 -optimizations !code/simplification/arithmetic,!field/*,!class/merging/*
  #忽略警告
 -ignorewarning

  # 保持哪些类不被混淆 google默认 不混淆 Activity 、Service ... 类的子类
  #混淆了可能编译不通过
  -keep public class * extends android.app.Fragment
  -keep public class * extends android.app.Activity
  -keep public class * extends android.app.Application
  -keep public class * extends android.app.Service
  -keep public class * extends android.content.BroadcastReceiver
  -keep public class * extends android.content.ContentProvider
  -keep public class * extends android.app.backup.BackupAgentHelper
  -keep public class * extends android.preference.Preference
  -keep public class com.android.vending.licensing.ILicensingService


   #保护注解
   -keepattributes *Annotation*

  #如果有引用v4包可以添加下面这行
  -keep public class * extends android.support.v4.app.Fragment

  #如果引用了v4或者v7包
  -dontwarn android.support.**
  -keep public class * extends android.view.View {
      public <init>(android.content.Context);
      public <init>(android.content.Context, android.util.AttributeSet);
      public <init>(android.content.Context, android.util.AttributeSet, int);
      public void set*(...);
  }

   #保持自定义控件类不被混淆
   -keepclasseswithmembers class * {
       public <init>(android.content.Context, android.util.AttributeSet);
   }

   #保持自定义控件类不被混淆
   -keepclassmembers class * extends android.app.Activity {
      public void *(android.view.View);
   }

   #保持 Parcelable 不被混淆
   -keep class * implements android.os.Parcelable {
     public static final android.os.Parcelable$Creator *;
   }

   #保持 Serializable 不被混淆
   -keepnames class * implements java.io.Serializable

   #保持 Serializable 不被混淆并且enum 类也不被混淆
   -keepclassmembers class * implements java.io.Serializable {
       static final long serialVersionUID;
       private static final java.io.ObjectStreamField[] serialPersistentFields;
       !static !transient <fields>;
       !private <fields>;
       !private <methods>;
       private void writeObject(java.io.ObjectOutputStream);
       private void readObject(java.io.ObjectInputStream);
       java.lang.Object writeReplace();
       java.lang.Object readResolve();
   }

   #保持枚举 enum 类不被混淆 如果混淆报错，建议直接使用上面的 -keepclassmembers class * implements java.io.Serializable即可
   -keepclassmembers enum * {
       public static **[] values();
       public static ** valueOf(java.lang.String);
   }

   #不混淆资源类
   -keepclassmembers class **.R$* {
       public static <fields>;
   }

   #keep model
   -keep class com.cc.net.**{*;}
   -keep class com.cc.net.rx.**{*;}

#okhttp
-dontwarn okhttp3.**
-keep class okhttp3.**{*;}

#okio
-dontwarn okio.**
-keep class okio.**{*;}

#okgo
-dontwarn com.lzy.okgo.**
-keep class com.lzy.okgo.**{*;}
#okrx2
-dontwarn com.lzy.okrx2.**
-keep class com.lzy.okrx2.**{*;}

#AVLoadingIndicatorView-->加载动画
-keep class com.wang.avi.** { *; }
-keep class com.wang.avi.indicators.** { *; }

