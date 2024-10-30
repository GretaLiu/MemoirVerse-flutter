// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:memoirverse/global/app_constants.dart';

class AIRecordService extends ChangeNotifier {
  bool _isRecord = true;
  bool get isRecord => _isRecord;
  bool _isDeleteTopic = false;
  bool get isDeleteTopic => _isDeleteTopic;
  set isDeleteTopic(delete) {
    _isDeleteTopic = delete;
    notifyListeners();
  }

  bool _enableVoice = true;
  bool get enableVoice => _enableVoice;
  set enableVoice(enable) {
    _enableVoice = enable;
    notifyListeners();
  }

  //ignore: prefer_final_fields
  Map? _selected_topic;
  Map? get selected_topic => _selected_topic;
  set selected_topic(Map? topic) {
    _selected_topic = topic;
    notifyListeners();
  }

  List _random_questions = [null, null, null];
  List get random_questions => _random_questions;
  set random_questions(questions) {
    _random_questions = questions;
    notifyListeners();
  }

  generateRandomQuestions() {
    List questions = [null, null, null];
    List selected = [];
    if (_selected_topic == null) return null;
    List topic_questions = _selected_topic!["questions"];
    int sum = topic_questions.length;
    final random = Random();
    int random_index;
    for (int i = 0; i < 3; i++) {
      if (i >= sum) {
        questions[i] = null;
        continue;
      }
      random_index = random.nextInt(sum);
      while (selected.contains(random_index)) {
        random_index = random.nextInt(sum);
      }

      questions[i] = topic_questions[random_index];
      selected.add(random_index);
    }
    random_questions = questions;
    notifyListeners();
  }

  set isRecord(isRecord) {
    _isRecord = isRecord;
    notifyListeners();
  }

  final List<Map> _topic_list = [
    {
      "title": "童年印象",
      "describe":
          "熟悉的街巷、温暖的家人、天真的玩伴,构成了我们最初的记忆。让我们重返那段充满欢笑与泪水的岁月,品味其中的酸甜苦辣,重拾内心最单纯的感动。",
      "image": "assets/images/childhood.png",
      "questions": [
        {
          "summary": "家族历史",
          "detail": "能追溯家族的历史到多久以前?最早的祖先是谁,来自哪里?",
          "prompt":
              "引以为傲的人物、事迹、居住地迁移、战争、移民、家族传统、独特家教理念、族谱如何传承、物品传承、有趣轶事、秘密、技艺、手艺传承"
        },
        {
          "summary": "父母印象",
          "detail": "小时候您眼中的父母是什么样的？",
          "prompt": "职业、性格特点、生活习惯、父母关系、相处日常、难忘的互动、被照顾、自主选择的权利、过分严格的管教"
        },
        {
          "summary": "童年玩伴",
          "detail": "您童年最好的朋友是谁？",
          "prompt": "如何相识、为何关系好、性格特点、朋友家庭、有趣经历、小冒险、共同语言、梦想同异、是否仍保持联系、后来呢"
        },
        {
          "summary": "家乡印象",
          "detail": "能讲讲您的出生的地方和家乡吗？",
          "prompt": "哪里出生、长大、成长环境、家庭条件、自然景观、风俗习惯、近年发展、如何看待家乡变迁"
        },
        {
          "summary": "重要的长辈",
          "detail": "成长过程中，有没有特别影响您的长辈？",
          "prompt":
              "关系、性格特点、职业背景、日常相处、年轻时故事、相处日常、难忘互动、重要教导、价值观影响、处事方式影响、人生抉择影响、现在的关系、感恩之处、遗憾之处、长远影响"
        },
        {
          "summary": "童年梦想",
          "detail": "小时候,您梦想长大后成为什么样的人?现在来看实现了吗?",
          "prompt":
              "梦想职业、憧憬原因、为梦想做过的努力、家人的态度、梦想的变迁、现实与梦想的差距、未实现的遗憾、意外的人生方向、对孩子梦想的态度、如何看待理想与现实"
        },
        {
          "summary": "童年趣事",
          "detail": "能分享一个童年时期让您印象深刻的趣事或糗事吗? ",
          "prompt":
              "事件背景、年龄、参与人物、具体情节、当时感受、他人反应、事后影响、现在回想的感觉、从中学到的教训、类似经历、如何影响了性格或处事方式"
        },
        {
          "summary": "童年劳动",
          "detail": "小时候,您和家人一起做过什么劳动? 比如农忙、经营生意或家庭作坊？",
          "prompt":
              "参与方式、您的任务、劳动强度、有趣事件、辛苦回忆、丰收喜悦、家人合作、邻里互助、对经商的认识、学到的技能、对职业选择的影响"
        },
        {
          "summary": "兄弟姐妹",
          "detail": "您有兄弟姐妹吗？小时候关系如何？",
          "prompt":
              "性格差异、玩耍方式、打闹争吵、和解方法、互相帮助、共同秘密、父母偏爱、成长后的关系变化、现在的联系频率、最怀念的时光、对您性格形成的影响"
        }
      ]
    },
    {
      "title": "青春回忆",
      "describe":
          "憧憬与迷茫并存,理想与现实交织。那些奋斗的汗水、成长的烦恼、初恋的心动,塑造了我们的性格与品格。重温那段激情燃烧的岁月,看看年少的自己如何蜕变。",
      "image": "assets/images/youth.png",
      "questions": [
        {
          "summary": "兴趣爱好",
          "detail": "您有没有被发现的特殊才能?后来如何发展的?",
          "prompt":
              "才能类型、发现经过、培养方式、练习过程、比赛经历、家人支持、放弃的原因、对自信心的影响、对职业规划的影响、现在是否还在利用这项才能、如何看待兴趣教育"
        },
        {
          "summary": "珍贵友谊",
          "detail": "您有没有一段特别珍视的友谊?为什么它如此特别?",
          "prompt":
              "相识经过、共同经历、性格异同、价值观契合、互帮互助事例、矛盾处理、成长历程、现状如何、对友谊的定义、如何维系感情、从中学到的人际相处之道"
        },
        {
          "summary": "师生关系",
          "detail": "还记得上学时最喜欢/讨厌的老师吗?留下了什么印象?",
          "prompt":
              "外表特征、说话语气、教学特点、难忘的课堂场景、处理问题的方式、对待学生的态度、批评表扬方式、特别的规矩、感动的事、受伤的经历、个人关照、重要建议、对学习态度的影响、对性格的影响、对价值观的影响、课后相处、同学们的评价、家庭背景、后来的联系、如果重逢想说的话、为人师表时的借鉴、最感谢和遗憾的事、那个年代老师的特点"
        },
        {
          "summary": "价值观碰撞",
          "detail": "青春期，您是否与长辈或同学发生过强烈分歧？",
          "prompt":
              "具体事件与场景、为什么产生分歧、您的想法和感受、长辈的态度、如何沟通化解、谁做出让步、有什么转折点、同伴的支持与建议、如何最终解决、事后反思、对性格和处事方式的影响、现在如何看待这件事、从中学到了什么、对教育下一代有什么启示、这段经历对您的人生有什么长远影响"
        },
        {
          "summary": "重要转折",
          "detail": "青少年时期，有没有一个事件或决定，让您的人生发生了改变？",
          "prompt":
              "突发事件还是主动选择、具体发生了什么、当时的生活状态、面临了什么选择、如何做出决定、家人的态度、朋友的反应、周围环境的变化、内心的波动与思考、如何克服困难、谁给予帮助、从中获得什么感悟、学到了什么经验、改变了哪些认知、对性格有什么影响、对人生方向产生了什么影响、现在回看这个转折的意义、如果重来会有不同选择吗"
        },
        {
          "summary": "校园生活",
          "detail": "您参加过社团活动和青年团体吗?",
          "prompt":
              "团体名称、加入原因、活动内容、担任职务、印象深刻的活动、团队合作经历、与成员的友谊、获得的荣誉、学到的技能、对性格的影响、对领导力的培养、最难忘的回忆、对后来工作或生活的影响、现在是否还保持联系、如何看待当时的经历"
        },
        {
          "summary": "青春恋爱",
          "detail": "您还记得第一次被另一个人所吸引吗?",
          "prompt":
              "年龄阶段、相识场合、吸引原因、心动感受、暗恋经历、表达方式、对方反应、周围人态度、家长态度、是否有结果、当时的社会氛围、青涩趣事、误会或尴尬、给您带来的成长、对爱情观的影响、现在回想的感受"
        },
        {
          "summary": "青春成长",
          "detail": "您觉得自己在成长过程中得到了良好指导吗?",
          "prompt":
              "关键人物、重要建议、人生困惑、解决方式、价值观形成、重大抉择、成长困难、克服方法、家庭支持、师长帮助、同伴影响、社会环境影响、自我摸索、重要领悟、对教育下一代的影响、如果重来希望得到什么样的指导"
        },
        {
          "summary": "青春学业",
          "detail": "您在学校学习成绩上表现好吗? 您在学校学习努力吗?",
          "prompt":
              "擅长科目、困难学科、学习方法、老师评价、同学互助、考试经历、竞赛经历、挫折与突破、家长期望、努力程度、时间分配、学习环境、最大进步、遗憾之处、对后来求学或工作的影响、对教育理念的影响"
        },
        {
          "summary": "初次离家",
          "detail": "您什么时候第一次离开家，独自去上学？外出打工？",
          "prompt":
              "离家原因、目的地选择、行前准备、家人反应、初到情景、适应过程、想家经历、独立生活、经济来源、困难克服、成长收获、人生历练、重要帮助、对性格的影响、对家乡的思念、对家的新理解"
        },
      ]
    },
    {
      "title": "职业初期",
      "describe":
          "初入职场的那些年,是我们真正走向社会的起点。懵懂却充满干劲,生疏却渴望成长。第一份工作、第一位良师、第一次成就感,这些都是宝贵的人生财富。",
      "image": "assets/images/profession.png",
      "questions": [
        {
          "summary": "初入社会",
          "detail": "您的第一份工作是什么?有什么难忘的经历？",
          "prompt":
              "工作内容、入职原因、工作环境、同事关系、印象深刻的客户或项目、犯过的错误、学到的技能、职场文化冲击、对职业规划的影响、如果重来会有什么不同选择"
        },
        {
          "summary": "城市选择",
          "detail": "您是如何选择工作城市的？经历过哪些城市的生活？",
          "prompt":
              "选择原因、居住环境、生活成本、文化差异、适应过程、社交圈子、发展机遇、城市印象、漂泊感受、生活质量、家人团聚、落户考虑、城市对比、重要决定、人生感悟、对城市选择的建议"
        },
        {
          "summary": "青年爱恋",
          "detail": "职业成长初期，恋人是如何陪伴您的？给予了怎样的支持？",
          "prompt":
              "相识经过、对方职业、共同话题、约会方式、家人意见、未来规划、经济基础、价值观差异、工作支持、事业影响、重要决定、相处模式、成长收获、现在回看的感悟、对年轻人的建议"
        },
        {
          "summary": "金钱观念",
          "detail": "记得第一份工资是如何支配的吗？当时是怎么看待金钱的？",
          "prompt":
              "工资数额、消费方式、理财意识、家庭贡献、攒钱目标、奢侈品定义、债务经历、投资尝试、暴富幻想、创业冲动、价值取向、消费习惯养成、经济压力、重要教训、价值观转变、对后来理财方式的影响"
        },
        {
          "summary": "得失选择",
          "detail": "为了工作和事业发展，您曾经放弃或牺牲过什么？",
          "prompt":
              "重要抉择、具体事件、决策过程、内心挣扎、家人态度、收获与遗憾、最大代价、感情影响、健康状况、时间分配、价值观改变、如何和解、现在看法、经验建议"
        },
        {
          "summary": "自主学习",
          "detail": "工作早期，您是如何发现自己的不足并主动提升的？",
          "prompt":
              "发现技能短板、学习契机、进修方式、时间投入、重要课程、实践机会、导师指点、同行交流、失败教训、突破瓶颈、成果展现、职场反馈、投入产出、坚持动力、目标达成、对后来发展的影响"
        },
        {
          "summary": "压力应对",
          "detail": "初入职场时，您遇到过什么样的压力？是如何克服的？",
          "prompt":
              "压力来源、具体表现、情绪变化、健康影响、应对方法、倾诉对象、重要支持、调节方式、失误教训、突破时刻、心态转变、经验总结、对压力认知的改变、现在处理压力的方式、给新人的建议"
        },
        {
          "summary": "职场贵人",
          "detail": "起步阶段，有遇到对您特别照顾或帮助的同事或领导吗？",
          "prompt":
              "相识契机、对方身份背景、性格特点、帮助方式、关键时刻、重要建议、职场经验传授、人脉引荐、项目机会、晋升提携、处事方法、为人之道、现在的关系、最感激之处、如何回报、对自己带人育人的影响"
        },
        {
          "summary": "专业积累",
          "detail": "您是如何在工作中逐步建立自己的专业优势的?",
          "prompt":
              "岗位要求、能力差距、学习途径、实践机会、关键项目、技能突破、专业认证、行业交流、竞争优势、成长节点、瓶颈突破、职业规划、个人品牌、核心竞争力、持续学习的动力、对专业发展的思考"
        },
        {
          "summary": "创业萌芽",
          "detail": "在最初工作的时候，您有过创业的想法吗？",
          "prompt":
              "创业念头、市场洞察、资源积累、风险评估、伙伴物色、家人态度、准备工作、犹豫顾虑、动力来源、失败教训、成功尝试、重要帮助、经验总结、对创业的认知变化、最终选择、对后来发展的影响"
        },
      ]
    },
    {
      "title": "家庭生活",
      "describe":
          "家是心灵的港湾,是最温暖的依靠。组建家庭、养育子女、相守相伴,每一个平凡的日子都值得铭记。那些柴米油盐里的甜蜜,柔情似水间的感动,构筑了生命中最珍贵的幸福。",
      "image": "assets/images/family.png",
      "questions": [
        {
          "summary": "缘分际遇",
          "detail": "还记得第一次遇见您的另一半时的情景吗？",
          "prompt":
              "初见场景、第一印象、相识过程、追求经过、让您心动的瞬间、交往中的趣事、双方家庭的态度、决定结婚的契机、求婚的细节、婚礼的准备、难忘的婚礼场景、蜜月旅行、最初同居生活的适应"
        },
        {
          "summary": "夫妻磨合",
          "detail": "婚后有什么事情和您想象的不一样？或是改变了您对婚姻的看法？",
          "prompt":
              "生活习惯差异、原生家庭观念冲突、处理矛盾的方式、角色分工的演变、经济分配方式、共同成长的经历、重大决策如何达成共识、对方最让您感动的时刻、最严重的争执、和解方式、维系感情的秘诀"
        },
        {
          "summary": "初为父母",
          "detail": "当您第一次抱起自己的孩子时，心里是什么感受？",
          "prompt":
              "得知怀孕时的心情、产前准备、分娩经历、第一次喂奶/换尿布、照顾新生儿的手忙脚乱、半夜哭闹、看着孩子第一次翻身/爬行/走路、第一次叫爸爸妈妈、育儿经验教训、夫妻分工照顾孩子、最难忘的温馨时刻"
        },
        {
          "summary": "教育理念",
          "detail": "在孩子教育问题上，您和配偶有什么不同的看法？如何达成一致？",
          "prompt":
              "教育方式的分歧、原生家庭影响、奖惩标准、学业期望、兴趣培养、性格培养、独立性培养、挫折教育、亲子沟通方式、教育中的困惑、后悔的决定、值得骄傲的决定、孩子给予的惊喜"
        },
        {
          "summary": "事业家庭",
          "detail": "在平衡事业和家庭时，您经历过哪些挣扎？",
          "prompt":
              "工作与家庭的时间分配、加班对家庭的影响、职业发展机会与家庭责任的取舍、配偶的支持方式、愧疚感的处理、家人的理解程度、重要决策的权衡过程、工作家庭双丰收的经历、遗憾的选择"
        },
        {
          "summary": "婆媳关系",
          "detail": "您是如何处理与对方父母的关系的？",
          "prompt":
              "工作与家庭的时间分配、加班对家庭的影响、职业发展机会与家庭责任初次见面印象、相处模式的建立、文化差异的冲突、教育理念的差异、节日走亲访友、老人住进门时的调适、照顾老人的分工、代际关系的处理技巧、维系和谐的经验、难忘的温馨时刻"
        },
        {
          "summary": "家庭变迁",
          "detail": "您觉得您的家庭这些年经历了哪些大的变化？",
          "prompt":
              "居住环境的改善、生活质量的提升、家庭氛围的变化、夫妻关系的成熟、亲子关系的演变、重大转折点、面对困难时全家的团结、最自豪的家庭时刻、遗憾的经历、对未来的期待"
        },
        {
          "summary": "孩子的蜕变",
          "detail": "孩子成长过程中，有哪些时刻让您特别记忆深刻？",
          "prompt":
              "考试成绩（好或坏）、发现孩子撒谎、被老师投诉时的心情、意外发现孩子的特长、看到孩子努力克服困难、孩子叛逆期的表现、最让您失望的一件事、最让您骄傲的一件事、意外发现孩子的成熟之处、担心变成欣慰的经历、对孩子的期望与现实的差距、如何调整自己的期待、与孩子之间的沟通突破、孩子的重要人生选择、发现教育方式的误区、见证孩子性格的转变、孩子给您上的一课、最令您感动的时刻、对孩子未来的新期待、想对过去的自己说的话"
        },
        {
          "summary": "成长收获",
          "detail": "组建家庭这些年，您觉得自己最大的改变是什么？",
          "prompt":
              "性格的磨合、处事方式的成熟、价值观的调整、人生优先级的变化、对婚姻的理解、对父母的理解、对子女教育的认识、处理人际关系的智慧、面对困难的勇气、为家庭付出的动力"
        },
        {
          "summary": "代际传承",
          "detail": "您的家庭，有什么传统或价值观是您特别想要传承下去的？",
          "prompt":
              "来自原生家庭的好传统、与配偶共同建立的家风、教育理念的传承、处世智慧的传递、家族故事的讲述、节日习俗的保持、家族技艺的传授、对下一代的期望、家庭精神的凝练、想要改变的陈规"
        },
      ]
    },
    {
      "title": "事业成就",
      "describe":
          "付出终有回报,努力必有收获。在事业的征程上,我们经历过挫折与考验,也收获过喜悦与荣耀。这些成就不仅是个人的光荣,更是时代发展的缩影。",
      "image": "assets/images/career.png",
      "questions": [
        {
          "summary": "转折时刻",
          "detail": "您的职业生涯，有没有一个关键的转折点，事业有了质的飞跃？",
          "prompt":
              "时代背景（政策变革、行业发展、技术革新）、机遇判断依据、选择和权衡、决策过程考量、身边人支持或质疑、转折带来的具体改变、事后看来的得失、对机遇把握的心得、对年轻人的建议、如何在变革中保持定力"
        },
        {
          "summary": "创新突破",
          "detail": "在您的专业领域，有什么重要的创新或突破是您引以为豪的？",
          "prompt":
              "创新的背景和起因、面临的技术难题、突破的关键点、团队协作过程、失败的教训、成功的喜悦、行业影响、社会效益、后续发展、对创新精神的理解、如何培养创新思维、创新对个人成长的意义"
        },
        {
          "summary": "领导艺术",
          "detail": "您认为最重要的领导力是什么？能分享一个体现这点的故事吗？",
          "prompt":
              "团队建设经验、危机处理案例、人才培养方法、决策机制、沟通技巧、激励手段、压力管理、权衡与取舍、个人魅力、价值观传递、管理哲学、领导力成长历程"
        },
        {
          "summary": "跨界融合",
          "detail": "工作是否涉及多个领域的交叉？对这种跨界有什么独特见解？",
          "prompt":
              "不同领域的知识积累、跨界思维的优势、学科整合的方法、创新点的发现、资源整合能力、多方协调经验、文理交融、产学研结合、国际合作、跨文化交流、综合能力培养、对未来发展的思考"
        },
        {
          "summary": "挫折超越",
          "detail": "能否分享一次重大的职业挫折，以及您是如何克服的？",
          "prompt":
              "困境的具体情况、面临的压力、情绪管理、寻求帮助、解决方案、调整策略、心态转变、重要支持、成长收获、经验总结、对挫折的新认识、如何帮助他人度过困境"
        },
        {
          "summary": "人生导师",
          "detail": "有没有一个人对您产生了重大的影响，可以称之为人生导师?",
          "prompt":
              "身份关系、相识经过、性格特点、专业领域、给予的建议、什么时候给予了关键指导、言传身教、价值观的影响、为什么称他/她为导师、现在的联系、如何传承教导"
        },
        {
          "summary": "科技适应",
          "detail": "在您的领域，技术发展带来了哪些重大变革？您是如何把握这些变化的？",
          "prompt":
              "第一次接触新技术的看法、质疑和困惑、学习新与试错的过程、关键的突破时刻、成功时的喜悦、失败的教训、说服他人的经历、上级的支持、下属的抵触、市场的反应、用户的反馈、技术风险的权衡、成本收益的考量、对行业的影响、创新精神的坚守"
        },
        {
          "summary": "团队协作",
          "detail": "一支团队最重要的是什么？如何打造了一个优秀的团队？",
          "prompt":
              "团队组建原则、人才选拔标准、培养机制、矛盾处理、绩效管理、文化建设、凝聚力打造、创新机制、团队荣誉、梯队建设、知识传承、团队精神的定义、团队对于业务的影响、团队崩离的经历、感动瞬间、管理的困惑"
        },
        {
          "summary": "国际视野",
          "detail": "您的工作中有什么国际拓展或竞争的经历？给您带来了什么启示？",
          "prompt":
              "国际化的契机、出海的动力、初期的困惑、决策的考量、风险的评估、资源的投入、团队的准备、文化的碰撞、标准的差距、政策的影响、竞争的压力、转型的阵痛、合作的得失、品牌的突破、远期的布局、经验的总结"
        },
        {
          "summary": "代际传承",
          "detail": "作为专家，您认为您的经验和智慧如何才能更好地传承给下一代？",
          "prompt":
              "重要的领悟、成长的关键、年轻人的特点、教导的方式、失败的教训、成功的秘诀、取舍的标准、应变的智慧、底线的坚守、创新的勇气、传统的价值、性格的塑造、习惯的养成、眼界的开拓、理想的播种、耐心的考验、代沟的困扰、惺惺相惜"
        },
      ]
    },
    {
      "title": "退休思考",
      "describe": "退休不是终点,而是人生新篇章的开始。放慢脚步,回望来时路,展望前方。这是总结智慧的时刻,也是享受生活的黄金期。",
      "image": "assets/images/retire.png",
      "questions": [
        {
          "summary": "生活转型",
          "detail": "临近退休的时候您是什么心情？退休初期，您经历了怎样的调整过程？",
          "prompt":
              "内心不舍、期待向往、忐忑担心、最后一天上班的场景、同事送别、交接工作、真正退休后的感受、生活节奏的改变、对工作的怀念、对自由的享受、对未来的规划、角色转换、节奏变化、心理波动、生活重建、习惯调整、关系重构、社交圈子、家庭定位"
        },
        {
          "summary": "晚年乐趣",
          "detail": "退休后，您发现了什么充实生活的活动或者乐趣？",
          "prompt":
              "新培养的兴趣爱好、参加的社区活动、认识的新朋友、学习的新技能、晨练习惯、园艺收获、读书心得、旅行见闻、志愿服务、带孙子的乐趣、老年大学经历、健身运动、棋牌活动、兴趣小组、生活的新期待"
        },
        {
          "summary": "岁月智慧",
          "detail": "如果让您用三个词来形容自己的一生，您会选择哪些词？为什么？",
          "prompt":
              "选词背后、关键抉择、重大转折、人生际遇、挫折磨砺、成就时刻、坚持信念、改变契机、情感支撑、内心追求、生命态度、价值坚守、遗憾释怀、得失感悟、人生哲学"
        },
        {
          "summary": "代际沟通",
          "detail": "您觉得和孩子沟通最重要的是什么？分享让您印象深刻的经历？",
          "prompt":
              "初始困惑、沟通障碍、认知差异、情感冲突、态度转变、意外发现、互动突破、理解过程、包容历程、原则坚持、方式调整、化解误会、教育反思、心理关照、代际纽带"
        },
        {
          "summary": "养生之道",
          "detail": "您如何理解养生？平时有什么特别的生活习惯？",
          "prompt":
              "作息时间、饮食习惯、运动方式、休息调节、看病体检、保健方法、营养搭配、心理调适、压力缓解、社交活动、兴趣培养、环境选择、起居讲究、养生心得、长寿秘诀"
        },
        {
          "summary": "人生回望",
          "detail": "如果时光倒流，您最想回到哪个时刻？",
          "prompt":
              "难忘时刻、重要抉择、青春往事、职业生涯、婚恋经历、教育子女、成就时刻、失意时期、重大转折、人生感悟、遗憾之处、自豪之处、想对过去自己说的话、想改变的决定、最珍惜的事"
        },
        {
          "summary": "生命意义",
          "detail": "您觉得什么是一个人活得有意义的标志？",
          "prompt":
              "价值追求、成就定义、幸福理解、人生目标、社会贡献、家庭责任、自我实现、心灵满足、人际关系、精神寄托、生命态度、成长经历、人生哲学、生命感悟、终极关怀"
        },
        {
          "summary": "朋辈情谊",
          "detail": "退休后，您和老朋友们都保持着什么样的联系？",
          "prompt":
              "聚会频率、联系方式、共同话题、互帮互助、情感支持、健康关心、共同活动、老友逝去、新朋友结识、代际沟通、群体活动、情感依托、相处之道、珍惜之情、遗憾之处"
        },
        {
          "summary": "家族传承",
          "detail": "您最想让子孙儿女记住您的什么品质或者教导？",
          "prompt":
              "核心信念、处世原则、人生经验、情感表达、言传身教、重要时刻、关键选择、生活智慧、为人之道、处事方法、育人之术、成败得失、取舍之道、精神追求、生命意义"
        },
        {
          "summary": "未来期待",
          "detail": "对于未来的日子，您有什么期待和打算？",
          "prompt":
              "生活规划、心愿清单、想去的地方、想学的技能、想做的事情、健康期望、家庭愿景、自我实现、社会参与、兴趣发展、关系经营、时间安排、新的挑战、人生目标、心灵追求"
        },
      ]
    },
    {
      "title": "一场旅行",
      "describe":
          "每一次远行都是一次心灵的历练。不同的风景、陌生的面孔、意外的际遇,丰富了我们的人生阅历。那些在路上的故事,是我们宝贵的精神财富。",
      "image": "assets/images/travel.png",
      "questions": []
    },
    {
      "title": "上山下乡",
      "describe": "一段特殊年代的集体记忆。在知青岁月里,我们经历了艰苦与磨练,也收获了成长与感动。",
      "image": "assets/images/countryside.png",
      "questions": []
    },
    {
      "title": "公益之心",
      "describe": "这里是场景的描述，回忆内容的描述什么描述都可以，到时候再加吧。没所谓的。是文字工作了",
      "image": "assets/images/public_welfare.png",
      "questions": []
    },
    // {
    //   "title": "留学外派",
    //   "describe": "这里是场景的描述，回忆内容的描述什么描述都可以，到时候再加吧。没所谓的。是文字工作了",
    //   "image": "assets/images/abroad.png",
    //   "questions": [
    //     {
    //       "summary": "家族历史",
    //       "detail": "能追溯家族的历史到多久以前?最早的祖先是谁,来自哪里?",
    //       "prompt":
    //           "引以为傲的人物、事迹、居住地迁移、战争、移民、家族传统、独特家教理念、族谱如何传承、物品传承、有趣轶事、秘密、技艺、手艺传承"
    //     }
    //   ]
    // },
    {
      "title": "学术生涯",
      "describe":
          "追求知识的道路从未停歇。在教学相长中成长,在探索真理中进步。那些埋头钻研的日日夜夜,那些豁然开朗的欣喜时刻,构成了别样人生。",
      "image": "assets/images/academic.png",
      "questions": []
    },
  ];
  List<Map> get topic_list => _topic_list;

  List<String> _selected_topic_list = [
    "童年印象",
    "青春回忆",
    "职业初期",
    "家庭生活",
    "事业成就",
    "退休思考"
  ];
  List<String> getNoSelected() {
    List<String> noSelected = [];
    bool selected = false;
    for (var i = 0; i < _topic_list.length; i++) {
      selected = false;
      for (var j = 0; j < _selected_topic_list.length; j++) {
        if (_selected_topic_list[j] == _topic_list[i]["title"]) {
          selected = true;
          break;
        } else {}
      }
      if (!selected) {
        noSelected.add(_topic_list[i]["title"]);
      }
    }
    return noSelected;
  }

  String getTopicImageFromTitle(String title) {
    String image = "assets/images/childhood.png";
    for (var i = 0; i < _topic_list.length; i++) {
      if (_topic_list[i]["title"] == title) {
        image = _topic_list[i]["image"];
      }
    }
    return image;
  }

  String getTopicDescribeFromTitle(String title) {
    String describe = "";
    for (var i = 0; i < _topic_list.length; i++) {
      if (_topic_list[i]["title"] == title) {
        describe = _topic_list[i]["describe"];
      }
    }
    return describe;
  }

  void selectOneTopic(String title) {
    for (int i = 0; i < _selected_topic_list.length; i++) {
      if (title == _selected_topic_list[i]) return;
    }
    _selected_topic_list.add(title);
    final box = GetStorage();
    box.write(AppConstants.selected_topic_list_key, _selected_topic_list);
    notifyListeners();
  }

  void noSelectOneTopic(String title) {
    _selected_topic_list.remove(title);
    final box = GetStorage();
    box.write(AppConstants.selected_topic_list_key, _selected_topic_list);
    notifyListeners();
  }

  List<String> get selected_topic_list => _selected_topic_list;
  set selected_topic_list(topic_list) {
    _selected_topic_list = topic_list;
  }

  getQuestionsFormTitle(String title) {
    for (int i = 0; i < _topic_list.length; i++) {
      if (title == _topic_list[i]["title"]) {
        return _topic_list[i]["question"];
      }
    }
    return [];
  }

  setSelectedTopicFormTitle(String title) {
    for (int i = 0; i < _topic_list.length; i++) {
      if (title == _topic_list[i]["title"]) {
        return _selected_topic = _topic_list[i];
      }
    }
    _selected_topic = null;
  }

  int _voice_type_index = 0;
  int get voice_type_index => _voice_type_index;
  set voice_type_index(index) {
    _voice_type_index = index;
    notifyListeners();
  }

  double _speaking_speed = 2;
  double get speaking_speed => _speaking_speed;
  set speaking_speed(speed) {
    _speaking_speed = speed;
    notifyListeners();
  }
}
