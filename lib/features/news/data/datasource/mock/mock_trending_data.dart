import 'package:topnews/features/news/data/model/news_model.dart';

final mockTrendingNews = [
  NewsModel(
    id: '1',
    title: '全球科技巨头发布革命性人工智能突破',
    content: '最新研发的AI系统展现出前所未有的认知能力，或将改变人类生活方式',
    imageUrl: 'https://picsum.photos/400/300?random=1',
    category: '科技',
    categoryId: 1,
    author: '科技时报',
    authorAvatar: 'https://picsum.photos/400/300?random=1',
    publishedAt: DateTime.now().subtract(const Duration(hours: 2)),
    readTime: 5,
    likes: 2345,
    views: 12345,
    comments: 456,
  ),
  NewsModel(
    id: '2',
    title: '突发!重大医疗突破有望治愈癌症',
    content: '国际顶尖实验室宣布在癌症治疗领域取得重大进展，新疗法进入临床试验阶段',
    imageUrl: 'https://picsum.photos/400/300?random=2',
    category: '健康',
    categoryId: 2,
    author: '医疗日报',
    authorAvatar: 'https://picsum.photos/400/300?random=2',
    publishedAt: DateTime.now().subtract(const Duration(hours: 3)),
    readTime: 4,
    likes: 5678,
    views: 34567,
    comments: 789,
  ),
  NewsModel(
    id: '3',
    title: '全球气候变化加剧,各国承诺采取紧急行动',
    content: '联合国气候大会达成历史性协议,各国将大幅减少碳排放',
    imageUrl: 'https://picsum.photos/400/300?random=3',
    category: '环境',
    categoryId: 3,
    author: '气候新闻',
    authorAvatar: 'https://picsum.photos/400/300?random=3',
    publishedAt: DateTime.now().subtract(const Duration(hours: 4)),
    readTime: 6,
    likes: 7890,
    views: 56789,
    comments: 901,
  ),
  NewsModel(
    id: '4',
    title: '全球经济复苏迎来新曙光',
    content: '多个主要经济体显示积极复苏迹象，全球贸易活动明显回暖',
    imageUrl: 'https://picsum.photos/400/300?random=4',
    category: '财经',
    categoryId: 4,
    author: '经济观察',
    authorAvatar: 'https://picsum.photos/400/300?random=4',
    publishedAt: DateTime.now().subtract(const Duration(hours: 5)),
    readTime: 7,
    likes: 4321,
    views: 78901,
    comments: 678,
  ),
  NewsModel(
    id: '5',
    title: '新能源汽车产业迎来重大变革',
    content: '多家车企发布突破性电池技术，续航里程大幅提升',
    imageUrl: 'https://picsum.photos/400/300?random=5',
    category: '科技',
    categoryId: 1,
    author: '汽车周刊',
    authorAvatar: 'https://picsum.photos/400/300?random=5',
    publishedAt: DateTime.now().subtract(const Duration(hours: 6)),
    readTime: 5,
    likes: 6543,
    views: 43210,
    comments: 890,
  ),
  NewsModel(
    id: '6',
    title: '教育改革新政策出台',
    content: '国家发布教育体系改革方案，着力推进素质教育发展',
    imageUrl: 'https://picsum.photos/400/300?random=6',
    category: '教育',
    categoryId: 5,
    author: '教育时报',
    authorAvatar: 'https://picsum.photos/400/300?random=6',
    publishedAt: DateTime.now().subtract(const Duration(hours: 7)),
    readTime: 6,
    likes: 8765,
    views: 65432,
    comments: 432,
  ),
  NewsModel(
    id: '7',
    title: '5G技术应用取得重大突破',
    content: '新一代通信技术在多个领域实现创新应用，助力智慧城市建设',
    imageUrl: 'https://picsum.photos/400/300?random=7',
    category: '科技',
    categoryId: 1,
    author: '通信科技',
    authorAvatar: 'https://picsum.photos/400/300?random=7',
    publishedAt: DateTime.now().subtract(const Duration(hours: 8)),
    readTime: 8,
    likes: 9876,
    views: 87654,
    comments: 543,
  ),
  NewsModel(
    id: '8',
    title: '体育界重大赛事即将开幕',
    content: '国际体育赛事筹备就绪，多个项目将首次采用新技术判定',
    imageUrl: 'https://picsum.photos/400/300?random=8',
    category: '体育',
    categoryId: 6,
    author: '体育快讯',
    authorAvatar: 'https://picsum.photos/400/300?random=8',
    publishedAt: DateTime.now().subtract(const Duration(hours: 9)),
    readTime: 4,
    likes: 3456,
    views: 98765,
    comments: 654,
  ),
  NewsModel(
    id: '9',
    title: '文化产业发展迎来新机遇',
    content: '数字技术赋能文化产业，传统文化焕发新活力',
    imageUrl: 'https://picsum.photos/400/300?random=9',
    category: '文化',
    categoryId: 7,
    author: '文化周报',
    authorAvatar: 'https://picsum.photos/400/300?random=9',
    publishedAt: DateTime.now().subtract(const Duration(hours: 10)),
    readTime: 5,
    likes: 5678,
    views: 76543,
    comments: 765,
  ),
  NewsModel(
    id: '10',
    title: '航天技术创新再创佳绩',
    content: '新型火箭发射成功，太空探索项目取得重要进展',
    imageUrl: 'https://picsum.photos/400/300?random=10',
    category: '科技',
    categoryId: 1,
    author: '航天科技',
    authorAvatar: 'https://picsum.photos/400/300?random=10',
    publishedAt: DateTime.now().subtract(const Duration(hours: 11)),
    readTime: 7,
    likes: 7890,
    views: 54321,
    comments: 876,
  ),
];

final mockTopNews = [
  NewsModel(
    id: '1',
    title: '全球科技巨头发布革命性人工智能突破',
    content: '最新研发的AI系统展现出前所未有的认知能力，或将改变人类生活方式',
    imageUrl: 'https://picsum.photos/400/300?random=6',
    category: 'Technology',
    categoryId: 1,
    author: 'Tech Review',
    authorAvatar: 'https://picsum.photos/400/300?random=6',
    publishedAt: DateTime.now().subtract(const Duration(hours: 2)),
    readTime: 8,
    likes: 1234,
    views: 9876,
    comments: 321,
  ),
  NewsModel(
    id: '2',
    title: '突发!重大医疗突破有望治愈癌症',
    content: '国际顶尖实验室宣布在癌症治疗领域取得重大进展，新疗法进入临床试验阶段',
    imageUrl: 'https://picsum.photos/400/300?random=7',
    category: 'Health',
    categoryId: 3,
    author: 'Medical Times',
    authorAvatar: 'https://picsum.photos/400/300?random=7',
    publishedAt: DateTime.now().subtract(const Duration(hours: 3)),
    readTime: 6,
    likes: 2345,
    views: 8765,
    comments: 432,
  ),
  NewsModel(
    id: '3',
    title: '全球气候变化加剧,各国承诺采取紧急行动',
    content: '联合国气候大会达成历史性协议,各国将大幅减少碳排放',
    imageUrl: 'https://picsum.photos/400/300?random=8',
    category: 'Environment',
    categoryId: 4,
    author: 'Climate News',
    authorAvatar: 'https://picsum.photos/400/300?random=8',
    publishedAt: DateTime.now().subtract(const Duration(hours: 4)),
    readTime: 7,
    likes: 3456,
    views: 7654,
    comments: 543,
  ),
];

final mockRecommendedNews = [
  NewsModel(
    id: '1',
    title: '人工智能在医疗领域取得重大突破',
    content: 'AI辅助诊断系统准确率达到95%以上，将显著提高医疗诊断效率',
    imageUrl: 'https://picsum.photos/400/300?random=11',
    category: 'Technology',
    categoryId: 1,
    author: 'Tech Health',
    authorAvatar: 'https://picsum.photos/400/300?random=12',
    publishedAt: DateTime.now().subtract(const Duration(hours: 5)),
    readTime: 6,
    likes: 2345,
    views: 8765,
    comments: 432,
  ),
  NewsModel(
    id: '2',
    title: '新能源汽车销量创历史新高',
    content: '全球新能源汽车市场快速增长，多个国家公布禁售燃油车时间表',
    imageUrl: 'https://picsum.photos/400/300?random=13',
    category: 'Auto',
    categoryId: 2,
    author: 'Auto News',
    authorAvatar: 'https://picsum.photos/400/300?random=14',
    publishedAt: DateTime.now().subtract(const Duration(hours: 6)),
    readTime: 5,
    likes: 1876,
    views: 6543,
    comments: 321,
  ),
  NewsModel(
    id: '3',
    title: '全球首个量子计算机商业化应用落地',
    content: '量子计算机在金融领域实现首个商业化应用，计算效率提升数千倍',
    imageUrl: 'https://picsum.photos/400/300?random=15',
    category: 'Technology',
    categoryId: 1,
    author: 'Quantum Weekly',
    authorAvatar: 'https://picsum.photos/400/300?random=16',
    publishedAt: DateTime.now().subtract(const Duration(hours: 7)),
    readTime: 8,
    likes: 3421,
    views: 9876,
    comments: 654,
  ),
  NewsModel(
    id: '4',
    title: '突破性研究揭示长寿基因奥秘',
    content: '科学家发现影响人类寿命的关键基因，为延长寿命提供新方向',
    imageUrl: 'https://picsum.photos/400/300?random=17',
    category: 'Health',
    categoryId: 3,
    author: 'Health Science',
    authorAvatar: 'https://picsum.photos/400/300?random=18',
    publishedAt: DateTime.now().subtract(const Duration(hours: 8)),
    readTime: 7,
    likes: 4532,
    views: 12345,
    comments: 876,
  ),
  NewsModel(
    id: '5',
    title: '全球首个可循环使用塑料问世',
    content: '新型可循环塑料材料研发成功，有望从根本上解决塑料污染问题',
    imageUrl: 'https://picsum.photos/400/300?random=19',
    category: 'Environment',
    categoryId: 4,
    author: 'Green Earth',
    authorAvatar: 'https://picsum.photos/400/300?random=20',
    publishedAt: DateTime.now().subtract(const Duration(hours: 9)),
    readTime: 6,
    likes: 2198,
    views: 7654,
    comments: 432,
  ),
  NewsModel(
    id: '6',
    title: '5G技术在工业领域应用取得突破',
    content: '5G远程控制技术成功应用于智能制造，开启工业4.0新篇章',
    imageUrl: 'https://picsum.photos/400/300?random=21',
    category: 'Technology',
    categoryId: 1,
    author: 'Industry 4.0',
    authorAvatar: 'https://picsum.photos/400/300?random=22',
    publishedAt: DateTime.now().subtract(const Duration(hours: 10)),
    readTime: 5,
    likes: 1765,
    views: 5432,
    comments: 234,
  ),
  NewsModel(
    id: '7',
    title: '突破性太阳能技术效率翻倍',
    content: '新型太阳能电池转换效率突破30%，可大幅降低清洁能源成本',
    imageUrl: 'https://picsum.photos/400/300?random=23',
    category: 'Energy',
    categoryId: 5,
    author: 'Energy Future',
    authorAvatar: 'https://picsum.photos/400/300?random=24',
    publishedAt: DateTime.now().subtract(const Duration(hours: 11)),
    readTime: 7,
    likes: 3876,
    views: 9876,
    comments: 654,
  ),
  NewsModel(
    id: '8',
    title: '脑机接口技术实现重要突破',
    content: '瘫痪病人通过意念控制机械臂成功实现精确操作，医疗领域迎来新突破',
    imageUrl: 'https://picsum.photos/400/300?random=25',
    category: 'Technology',
    categoryId: 1,
    author: 'Neural Tech',
    authorAvatar: 'https://picsum.photos/400/300?random=26',
    publishedAt: DateTime.now().subtract(const Duration(hours: 12)),
    readTime: 8,
    likes: 4321,
    views: 11234,
    comments: 765,
  ),
  NewsModel(
    id: '9',
    title: '全球首个室温超导材料问世',
    content: '科学家成功研发室温超导材料，将革命性改变能源传输方式',
    imageUrl: 'https://picsum.photos/400/300?random=27',
    category: 'Science',
    categoryId: 6,
    author: 'Science Daily',
    authorAvatar: 'https://picsum.photos/400/300?random=28',
    publishedAt: DateTime.now().subtract(const Duration(hours: 13)),
    readTime: 6,
    likes: 2987,
    views: 8765,
    comments: 543,
  ),
  NewsModel(
    id: '10',
    title: '新型疫苗技术可预防多种病毒',
    content: '革命性疫苗平台可快速应对多种病毒变异，为未来疾病防控提供新方案',
    imageUrl: 'https://picsum.photos/400/300?random=29',
    category: 'Health',
    categoryId: 3,
    author: 'Medical Innovation',
    authorAvatar: 'https://picsum.photos/400/300?random=30',
    publishedAt: DateTime.now().subtract(const Duration(hours: 14)),
    readTime: 7,
    likes: 3654,
    views: 10234,
    comments: 876,
  ),
];
