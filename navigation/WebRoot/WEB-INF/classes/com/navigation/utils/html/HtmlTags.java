package com.navigation.utils.html;

/**
 * 包含 {@code HTML} 标签名称作为常量的工具类。
 * 
 * @author Fuchun
 * @version 1.0, 2009-06-09
 */
public class HtmlTags {

    /**
     * {@code HTML} 中表示描（链接）的标签名称 - {@code a}。
     * <ul>
     * <li>通过使用 {@code href} 属性，创建指向另外一个文档的链接（或超链接）</li>
     * <li>通过使用 {@code name} 或 {@code id} 属性，创建一个文档内部的书签（也就是说，可以创建指向文档片段的链接）</li>
     * </ul>
     */
    public static final String ANCHOR         = "a";

    /** {@code HTML} 中表示一个缩写形式的标签名称 - {@code abbr}。 */
    public static final String ABBR           = "abbr";

    /** {@code HTML} 中表示只取首字母缩写的标签名称 - {@code acronym}。 */
    public static final String ACRONYM        = "acronym";

    /** {@code HTML} 中定义地址、签名或者文档的作者身份的标签名称 - {@code address}。 */
    public static final String ADDRESS        = "address";

    /**
     * {@code HTML} 中定义图像映射中的区域的标签名称 - {@code area}。
     * <ul>
     * <li>在 HTML 中，{@code <area>} 没有结束标签。</li>
     * <li>在 XHTML 中，{@code <area>} 必须正确地关闭。</li>
     * </ul>
     */
    public static final String AREA           = "area";

    /** {@code HTML} 中定义粗体文本效果的标签名称 - {@code b}。 */
    public static final String BOLD           = "b";

    /**
     * {@code HTML} 中定义规定页面中所有链接的基准 URL 的标签名称 - {@code base}。
     * <ul>
     * <li>在 HTML 中，{@code <base>} 没有结束标签。</li>
     * <li>在 XHTML 中，{@code <base>} 必须正确地关闭。</li>
     * </ul>
     */
    public static final String BASE           = "base";

    /** {@code HTML} 中定义可覆盖默认的文本方向的标签名称 - {@code bdo}。 */
    public static final String BDO            = "bdo";

    /** {@code HTML} 中定义大号字体效果的标签名称 - {@code big}。 */
    public static final String BIG            = "big";

    /** {@code HTML} 中定义一个块引用的标签名称 - {@code blockquote}。 */
    public static final String BLOCK_QUOTE    = "blockquote";

    /**
     * {@code HTML} 中定义文档的主体的标签名称 - {@code body}。
     * <ul>
     * <li>在 HTML 4.01 中，所有 {@code body} 元素的“呈现属性”均不被赞成使用。</li>
     * <li>在 XHTML 1.0 Strict DTD 中，所有 {@code body} 元素的“呈现属性”均不被支持。</li>
     * </ul>
     */
    public static final String BODY           = "body";

    /** {@code HTML} 中定义插入一个简单的换行符的标签名称 - {@code br}。 */
    public static final String BR             = "br";

    /** {@code HTML} 中定义一个表格标题的标签名称 - {@code caption}。 */
    public static final String CAPTION        = "caption";

    /**
     * {@code HTML} 中对其所包括的文本进行水平居中的标签名称 - {@code center}。
     * <ul>
     * <li>在 HTML 4.01 中，{@code center} 元素不被赞成使用。</li>
     * <li>在 XHTML 1.0 Strict DTD 中，{@code center} 元素不被支持。</li>
     * </ul>
     */
    public static final String CENTER         = "center";

    /** {@code HTML} 中定义引用的标签名称 - {@code cite}。 */
    public static final String CITE           = "cite";

    /** {@code HTML} 中定义计算机代码文本的标签名称 - {@code code}。 */
    public static final String CODE           = "code";

    /**
     * {@code HTML} 中为表格中一个或多个列定义属性值的标签名称 - {@code col}。 <strong>只能在表格或
     * {@link #COLUMN_GROUP} 中使用此元素</strong>
     * <ul>
     * <li>在 HTML 中，{@code <col>} 没有结束标签。</li>
     * <li>在 XHTML 中，{@code <col>} 必须正确地嵌套。</li>
     * </ul>
     */
    public static final String COLUMN         = "col";

    /**
     * {@code HTML} 中定义表格列的分组的标签名称 - {@code colgroup}。<strong>只有在
     * <tt>{@link #TABLE}</tt> 标签内才是合法的</strong>
     */
    public static final String COLUMN_GROUP   = "colgroup";

    /**
     * {@code HTML} 中定义列表中定义条目的定义部分的标签名称 - {@code dd}。<strong>只能在 {@link #DL}
     * 标签中使用此元素</strong>
     */
    public static final String DD             = "dd";

    /**
     * {@code HTML} 中定义文档中已被删除的文本的标签名称 - {@code del}。<strong>与 {@link #INS}
     * 标签配合使用</strong>
     */
    public static final String DEL            = "del";

    /** {@code HTML} 中定义文档中的分区或节的标签名称 - {@code div}。 */
    public static final String DIVISION       = "div";

    /**
     * {@code HTML} 中定义列表的标签名称 - {@code dl}。<strong>两个子元素：{@link #DT} 和
     * {@link #DD}</strong>
     */
    public static final String DL             = "dl";

    /**
     * {@code HTML} 中定义列表中的项目的标签名称 - {@code dt}。<strong>只能在 {@link #DL}
     * 标签中使用此元素</strong>
     */
    public static final String DT             = "dt";

    /** {@code HTML} 中定义把文本定义为强调的内容的标签名称 - {@code em}。 */
    public static final String EMPHASIZE      = "em";

    /**
     * {@code HTML} 中将表单内的相关元素分组的标签名称 - {@code fieldset}。<strong>通常配合
     * {@link #LEGEND} 标签使用</strong>
     */
    public static final String FIELDSET       = "fieldset";

    /**
     * {@code HTML} 中规定文本的字体、字体尺寸、字体颜色的标签名称 - {@code font}。
     * <ul>
     * <li>在 HTML 4.01 中，{@code <font>} 元素不被赞成使用。 </li>
     * <li>在 XHTML 1.0 Strict DTD 中，{@code <font>} 元素不被支持。</li>
     * </ul>
     */
    public static final String FONT           = "font";

    /** {@code HTML} 中为用户输入创建表单的标签名称 - {@code form}。 */
    public static final String FORM           = "form";

    /**
     * {@code HTML} 中在 {@link #FRAMESET} 中定义一个框架的标签名称 - {@code frame}。
     * <ul>
     * <li>在 HTML 中，{@code <frame>} 标签没有结束标签。</li>
     * <li>在 XHTML 中，{@code <frame>} 标签必须被正确地关闭。</li>
     * </ul>
     */
    public static final String FRAME          = "frame";

    /** {@code HTML} 中定义一个框架集的标签名称 - {@code frameset}。 */
    public static final String FRAMESET       = "frameset";

    /** {@code HTML} 中用于定义文档的头部的标签名称 - {@code head}。 */
    public static final String HEAD           = "head";

    /** {@code HTML} 中用于定义最大的标题的标签名称 - {@code h1}。 */
    public static final String H1             = "h1";

    /** {@code HTML} 中用于定义标题的标签名称 - {@code h2}。 */
    public static final String H2             = "h2";

    /** {@code HTML} 中用于定义标题的标签名称 - {@code h3}。 */
    public static final String H3             = "h3";

    /** {@code HTML} 中用于定义标题的标签名称 - {@code h4}。 */
    public static final String H4             = "h4";

    /** {@code HTML} 中用于定义标题的标签名称 - {@code h5}。 */
    public static final String H5             = "h5";

    /** {@code HTML} 中用于定义最小的标题的标签名称 - {@code h6}。 */
    public static final String H6             = "h6";

    /**
     * {@code HTML} 中插入一个水平线的标签名称 - {@code hr}。
     * <ul>
     * <li>在 HTML 中， {@code <hr>} 标签没有结束标签。</li>
     * <li>在 XHTML 中， {@code <hr>} 必须被正确地关闭。
     * <li>在 HTML 4.01 中，{@code hr} 元素的所有呈现属性均不被赞成使用。</li>
     * <li>在 XHTML 1.0 Strict DTD 中，{@code hr} 元素的所有呈现属性均不被支持。</li>
     * </ul>
     */
    public static final String HR             = "hr";

    /** 此元素可告知浏览器其自身是一个 {@code HTML} 文档 - {@code html}。 */
    public static final String HTML           = "html";

    /** {@code HTML} 中定义斜体文本效果的标签名称 - {@code i}。 */
    public static final String ITALIC         = "i";

    /** {@code HTML} 中创建一个包含另外一个文档的内联框架的标签名称 - {@code iframe}。 */
    public static final String IFRAME         = "iframe";

    /**
     * {@code HTML} 中定义一副图像的标签名称 - {@code img}。
     * <ul>
     * <li>在 HTML 中，{@code <img>} 标签没有结束标签。</li>
     * <li>在 XHTML 中，{@code <img>} 标签必须被正确地关闭。</li>
     * <li>在 HTML 4.01 中，不赞成使用 {@code img} 元素的 "align"、"border"、"hspace" 以及
     * "vspace" 属性。</li>
     * <li>在 XHTML 1.0 Strict DTD 中，不支持 {@code img} 元素的
     * "align"、"border"、"hspace" 以及 "vspace" 属性。</li>
     * </ul>
     */
    public static final String IMAGE          = "img";

    /**
     * {@code HTML} 中输入域的开始，在其中用户可输入数据的标签名称 - {@code input}。
     * <ul>
     * <li>在 HTML 中，{@code <input>} 标签没有结束标签。</li>
     * <li>在 XHTML 中，{@code <input>} 标签必须被正确地关闭。</li>
     * </ul>
     */
    public static final String INPUT          = "input";

    /** {@code HTML} 中定义一个被插入的文本的标签名称 - {@code ins}。 */
    public static final String INS            = "ins";

    /** {@code HTML} 中定义键盘文本的标签名称 - {@code kbd}。 */
    public static final String KBD            = "kbd";

    /** {@code HTML} 中向控件定义标注（标记）的标签名称 - {@code label}。 */
    public static final String LABEL          = "label";

    /** {@code HTML} 中可为 {@link #FIELDSET} 定义一个标题的标签名称 - {@code legend}。 */
    public static final String LEGEND         = "legend";

    /**
     * {@code HTML} 中定义了列表项目的标签名称 - {@code li}。<strong>作为
     * {@link #UNORDERED_LIST} 或 {@link #ORDERED_LIST} 的子元素使用</strong>
     */
    public static final String LIST           = "li";

    /** {@code HTML} 中定义了当前文档与 Web 集合中其他文档的关系的标签名称 - {@code link}。 */
    public static final String LINK           = "link";

    /** {@code HTML} 中定义一个客户端图像映射的标签名称 - {@code map}。 */
    public static final String MAP            = "map";

    /** {@code HTML} 中定义一个菜单列表的标签名称 - {@code menu}。 */
    public static final String MENU           = "menu";

    /** {@code HTML} 中可提供有关页面的元信息的标签名称 - {@code meta}。 */
    public static final String META           = "meta";

    /** {@code HTML} 中可为那些不支持框架的浏览器显示文本的标签名称 - {@code noframes}。 */
    public static final String NOFRAMES       = "noframes";

    /** {@code HTML} 中用来定义在脚本未被执行时的替代内容（文本）的标签名称 - {@code noscript}。 */
    public static final String NOSCRIPT       = "noscript";

    /** {@code HTML} 中定义一个嵌入的对象的标签名称 - {@code object}。 */
    public static final String OBJECT         = "object";

    /**
     * {@code HTML} 中定义一个有序列表的标签名称 - {@code ol}。
     * <ul>
     * <li>在 HTML 4.01 中，{@code ol} 元素的 "compact"、"start" 以及 "type"
     * 属性是不被赞成使用的。</li>
     * <li>在 XHTML 1.0 Strict DTD 中，{@code ol} 元素的 "compact"、"start" 以及 "type"
     * 属性是不被支持的。</li>
     * </ul>
     */
    public static final String ORDERED_LIST   = "ol";

    /**
     * {@code HTML} 中定义选项组的标签名称 - {@code optgroup}。<strong>作为 {@link #SELECT}
     * 的子元素使用</strong>
     */
    public static final String OPTION_GROUP   = "optgroup";

    /**
     * {@code HTML} 中定义下拉列表中的一个选项的标签名称 - {@code option}。<strong>作为
     * {@link #SELECT} 的子元素使用</strong>
     */
    public static final String OPTION         = "option";

    /** {@code HTML} 中定义一个段落的标签名称 - {@code p}。 */
    public static final String PARAGRAPH      = "p";

    /**
     * {@code HTML} 中为包含它的 {@link #OBJECT} 标签提供参数的标签名称 - {@code param}。
     * <ul>
     * <li>在 HTML 中，{@code <param>} 标签没有结束标签。</li>
     * <li>在 XHTML 中，{@code <param>} 标签必须被正确地关闭。</li>
     * </ul>
     */
    public static final String PARAM          = "param";

    /** {@code HTML} 中定义预格式化的文本的标签名称 - {@code pre}。 */
    public static final String PRE            = "pre";

    /** {@code HTML} 中定义一个短(行内)的引用的标签名称 - {@code q}。 */
    public static final String QUOTE          = "q";

    /** {@code HTML} 中定义加删除线的文本的标签名称 - {@code s}。 */
    public static final String STRIKE_THROUGH = "s";

    /** {@code HTML} 中定义样本文本的标签名称 - {@code samp}。 */
    public static final String SAMP           = "samp";

    /** {@code HTML} 中定义一段诸如 JavaScript 的脚本的标签名称 - {@code script}。 */
    public static final String SCRIPT         = "script";

    /** {@code HTML} 中创建单选或多选菜单的标签名称 - {@code select}。 */
    public static final String SELECT         = "select";

    /** {@code HTML} 中定义小号字体效果的标签名称 - {@code small}。 */
    public static final String SMALL          = "small";

    /** {@code HTML} 中用来组合文档中的行内元素的标签名称 - {@code span}。 */
    public static final String SPAN           = "span";

    /** {@code HTML} 中定义为语气更强的强调的内容的标签名称 - {@code strong}。 */
    public static final String STRONG         = "strong";

    /** {@code HTML} 中定义一段 CSS 的样式的内容的标签名称 - {@code style}。 */
    public static final String STYLE          = "style";

    /** {@code HTML} 中定义下标文本的标签名称 - {@code sub}。 */
    public static final String SUB            = "sub";

    /** {@code HTML} 中定义上标文本的标签名称 - {@code sup}。 */
    public static final String SUP            = "sup";

    /** {@code HTML} 中定义表格的标签名称 - {@code table}。 */
    public static final String TABLE          = "table";

    /** {@code HTML} 中定义一段表格主体（正文）的标签名称 - {@code tbody}。 */
    public static final String TBODY          = "tbody";

    /** {@code HTML} 中定义表格的一个单元格的标签名称 - {@code td}。 */
    public static final String TD             = "td";

    /**
     * {@code HTML} 中定义一个文本区域 (text-area) （一个多行的文本输入区域）的标签名称 - {@code textarea}。
     */
    public static final String TEXTAREA       = "textarea";

    /** {@code HTML} 中定义表格的页脚（脚注）的标签名称 - {@code tfoot}。 */
    public static final String TFOOT          = "tfoot";

    /** {@code HTML} 中定义表格内的表头单元格的标签名称 - {@code th}。 */
    public static final String TH             = "th";

    /** {@code HTML} 中定义表格的表头的标签名称 - {@code thead}。 */
    public static final String THEAD          = "thead";

    /** {@code HTML} 中定义文档的标题的标签名称 - {@code title}。 */
    public static final String TITLE          = "title";

    /** {@code HTML} 中定义表格的一行的标签名称 - {@code tr}。 */
    public static final String TR             = "tr";

    /** {@code HTML} 中定义类似打字机或者等宽的文本的标签名称 - {@code tt}。 */
    public static final String TT             = "tt";

    /** {@code HTML} 中定义下划线文本的标签名称 - {@code u}。 */
    public static final String UNDERLINE      = "u";

    /** {@code HTML} 中定义无序列表的标签名称 - {@code ul}。 */
    public static final String UNORDERED_LIST = "ul";

    /**
     * {@code HTML} 中定义变量的标签名称 - {@code var}。<strong>将此标签与 {@link #PRE} 及
     * {@link #CODE} 标签配合使用</strong>
     */
    public static final String VAR            = "var";
}
