import 'package:flutter_codeblog/components/constants/api_constant.dart';

class ArticleInfoModel {
  String? id,
      title,
      content,
      image,
      catId,
      catName,
      author,
      view,
      status,
      createdAt;
  bool? isFavorite;

  ArticleInfoModel(
    this.image,
    this.title,
    this.content,
  );
  ArticleInfoModel.fromjson(Map<String, dynamic> element) {
    var baseElement = element['info'];
    id = baseElement['id'];
    title = baseElement['title'];
    content = baseElement['content'];
    image = ApiConstant.domainUrl + baseElement['image'];
    catId = baseElement['cat_id'];
    catName = baseElement['cat_name'];
    author = baseElement['author'];
    view = baseElement['view'];
    status = baseElement['status'];
    createdAt = baseElement['created_at'];
    isFavorite = element['isFavorite'];
  }
}

// "info": {
// "id": "5",
// "title": "سونی در حال کار بر روی دوال سنس جدید است",
// "content": "تام هندرسن (Tom Henderson) افشاگر معروف دنیای ویدیو گیم مدعی شده سونی (Sony) در حال کار بر روی دوال سنس جدید است.\r\n\r\nدوال سنس (Dualsense) یا همان کنترلر‌های کنسول پلی استیشن 5 با ویژگی‌های جذابی از جمله دکمه‌های تریگر تطبیق پذیر معرفی شدند، این ویژگی بسیار جالب بود اما از طرفی به معنای پیچیدگی مکانیکی بیشتری در این کنترلر بود که همین امر باعث خرابی و اشکالات زیادی در این کنترلر می‌شد، مانند در رفتگی فنر زیر تریگر‌ها که باعث می‌شد این دکمه‌ها دیگر مثل قبل کار نکنند ( البته به راحتی قابل تعمیر بود) و البته مشکل دریفت (Drift) که خیلی سریع تر از آنچه که می‌بایست در این کنترلر رخ می‌داد. سونی مدتی بعد با عرضه نسل جدید دوال سنس که تغییرات فنی کمی کرده بود سعی در اصلاح این مشکلات کرد که تا حدی موفق بود. حال در جدید‌ترین شایعات منتشر شده توسط افشاگر معروف دنیای ویدیو گیم یعنی تام هندرسن، سونی در حال کار بر روی یک نسخه حرفه‌ای‌تر از کنترلر دوال سنس با نام پرو (Pro) است. مشابه این اقدام را قبلا مایکروسافت (Microsoft) با معرفی سری الیت (Elite) کنترلر‌های ایکس باکس کرده بود؛ که در این کنترلر‌ها ما شاهد دکمه‌های بیشتر با قابلیت شخصی سازی، تغییر میزان حساسیت تریگر‌ها و سری‌های متفاوت برای جوی استیک ( Joystick) ها بودیم.\r\n\r\nبر اساس گزارشاتی تازه سونی در حال کار بر روی کنترلر‌هایی جدید است که از آن‌ها با نام پرو یاد شده و احتمالا به زودی به صورت رسمی معرفی می‌شوند. این اخبار بر اساس گفته‌های افشاگر معروف دنیای ویدیو گیم، تام هندرسن نویسنده وبسایت Try Hard Guides، است که مدعی شده تصاویری از نمونه اولیه این کنترلر دیده، البته منبع این تصاویر خواسته تا ناشناس باقی بماند.\r\n\r\nهندرسن گفته است که پایه و اساس استایل این کنترلر همانند دوال سنس معمولی است و فقط در تعداد دکمه‌ها متفاوت ظاهر شده. همچنین این کنترلر دارای سری‌های مختلف برای جوی استیک است که با یک دکمه که در زیر جوی استیک قرار دارد قابل تعویض هستند، همچنین تریگر‌هایی با حساسیت قابل تنظیم، گریپ‌های قابل جداسازی و دکمه‌هایی در پشت کنترلر در دوال سنس جدید وجود دارند که هندرسن از این دکمه‌ها با عنوان «پدال‌های آویزان» یاد کرد؛ تقریبا همانند همان چیز‌هایی که در کنترلر الیت ایکس باکس دیدیم.\r\n\r\nهندرسن گفته است که منبع وی از دوال سنس جدید با عنوان «کنترلر پرو پلی استیشن 5» یاد کرده، هرچند که هنوز مشخص نیست که این نام رسمی آن خواهد بود یا خیر. البته به احتمال زیاد تا پایان ماه ژوئن شاهد رونمایی رسمی آن خواهیم بود.",
// "image": "/Techblog/assets/upload/images/article/20220707214730.jpg",
// "cat_id": "1",
// "cat_name": "اخبار و مقالات",
// "author": "بهرام امینی",
// "view": "193",
// "status": "1",
// "created_at": "۱۴۰۱/۲/۲۹"
// },
// "isFavorite": false,
