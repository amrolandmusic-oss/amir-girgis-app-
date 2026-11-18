# تجهيز ملف APK لتطبيق Amir Girgis

## محتويات المشروع
- صورة الفنان داخل `assets/images/profile.jpg`.
- أغنيتا «ألقيت بألواني وحبري» و«شوفلي حل» داخل `assets/music/`، ومتاح تشغيلهما دون إنترنت.
- اسم التطبيق الظاهر: Amir Girgis.

## أسهل طريقة لبناء APK دون تثبيت Android Studio على الكمبيوتر
1. فك ضغط ملف المشروع.
2. أنشئ مستودعاً جديداً على GitHub باسم `amir-girgis-app`.
3. ارفع **محتويات مجلد `amir_girgis_app`** إلى المستودع (وليس ملف ZIP نفسه).
4. افتح تبويب **Actions** في المستودع.
5. اختر **Build Amir Girgis APK** ثم **Run workflow**.
6. انتظر حتى تنتهي المهمة بنجاح.
7. افتح نتيجة التشغيل، ثم نزّل الملف من قسم **Artifacts** باسم `Amir-Girgis-APK`.
8. فك ضغط ملف Artifact، وستجد `app-release.apk`. انقله إلى هاتف Android وثبّته. قد يطلب الهاتف السماح بالتثبيت من هذا المصدر.

## بناء محلياً (اختياري)
يتطلب Flutter stable وAndroid Studio مع Android SDK:

```bash
flutter create . --platforms=android
flutter pub get
flutter build apk --release
```

المسار الناتج:
`build/app/outputs/flutter-apk/app-release.apk`

## ملاحظة مهمة عن البث أونلاين
الأغنيتان الحاليتان مضمنتان داخل التطبيق وتعملان أوفلاين. لتفعيل البث أونلاين يجب رفع نسخ MP3 إلى استضافة HTTPS تملكها، ثم إضافة الرابط المباشر لكل أغنية في قائمة `tracks` داخل `lib/main.dart` في خاصية `url` مع الإبقاء على `assetPath` للتشغيل دون إنترنت.

هذا المشروع لا يتضمن بعد لوحة إدارة أو خدمة استضافة؛ كما يجب اختبار APK على هاتف فعلي قبل توزيعه.
