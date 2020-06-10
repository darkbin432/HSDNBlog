/*
Navicat MySQL Data Transfer

Source Server         : aliyun
Source Server Version : 50730
Source Host           : 47.114.136.8:3306
Source Database       : hsdn

Target Server Type    : MYSQL
Target Server Version : 50730
File Encoding         : 65001

Date: 2020-06-10 15:07:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `blog`
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `blog_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博文编号',
  `content` varchar(8191) COLLATE utf8_bin NOT NULL COMMENT '博文内容',
  `user_id` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '发表该博文的用户ID',
  `time` datetime NOT NULL COMMENT '博文的发表时间',
  `title` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '博文的标题',
  `type` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '博文的类型',
  PRIMARY KEY (`blog_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='博客表，记录博客的信息';

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('8', '[题目传送门](http://codeforces.com/problemset/problem/1180/E)\r\n# 题目大意：\r\n　　给出a序列和b序列，a序列为各种食物的价格，b序列为一列排着队的小朋友拥有的钱，小朋友依次购买食物，每个人都买自己能买的起的最贵的食物，买不起就离开队伍。给出q次操作，操作1是修改食物的价格，操作2是修改小朋友的钱，每次操作后询问当小朋友买完之后，能买到的最贵的食物的价格是多少，没有食物了就输出-1.\r\n\r\n# 思路：\r\n\r\n　　首先，小朋友的顺序对最终答案没有任何影响，因为如果两个小朋友能买两个东西，这两个小朋友无论怎么换，都是能买的了的。\r\n\r\n　　其次，对于一个价格为x的物品，如果有一个钱大于等于x的小朋友，就可以买走这个物品。如果我们把价格想象成一条数轴，那么物品就是1，小朋友就是-1，价格或者钱就是坐标轴的位置，这道题就转化成了求最大的后缀和大于等于1的下标。\r\n\r\n　　最后，我们用线段树来维护这个值，注意用线段树维护最大后缀和时，在查询时要注意后面的区间的影响。\r\n# CODE\r\n```C++\r\n#include<bits/stdc++.h>\r\n#define clr(a,b) memset(a,b,sizeof(a))\r\nusing namespace std;\r\ntypedef long long ll;\r\nconst int maxn=1000010;\r\nint n,m,q;\r\nint sum[maxn<<2],maxx[maxn<<2];\r\nint a[maxn],b[maxn];\r\nvoid update(int o,int l,int r,int p,int val){\r\n    if(l==r){\r\n        sum[o]+=val;\r\n        maxx[o]+=val;\r\n        return;\r\n    }\r\n    int mid=(l+r)>>1;\r\n    if(p<=mid)update(o<<1,l,mid,p,val);\r\n    else update(o<<1|1,mid+1,r,p,val);\r\n    sum[o]=sum[o<<1]+sum[o<<1|1];\r\n    maxx[o]=max(maxx[o<<1|1],maxx[o<<1]+sum[o<<1|1]);\r\n    //这里的每一个maxx，都是对应的 区间最大后缀和  但不是整根数轴的最大后缀和。 \r\n}\r\nstruct node{\r\n    int max,sum;\r\n};\r\nint query(int o,int l,int r,node tep){\r\n    if(l==r){\r\n        return l;\r\n    }\r\n    int mid=(l+r)>>1;\r\n    node tep2;\r\n    tep2.sum=tep.sum+sum[o<<1|1];\r\n    tep2.max=maxx[o<<1|1]+tep.sum;//将 标号为o这段区间的后面一段（o+1）的影响合并到o区间中 \r\n    if(tep2.max>0){\r\n        return query(o<<1|1,mid+1,r,tep);\r\n    }\r\n    else {\r\n        return query(o<<1,l,mid,tep2);\r\n    }\r\n}\r\nint main(){\r\n    while(cin>>n>>m){\r\n        clr(sum,0),clr(maxx,0);\r\n        for(int i=1;i<=n;i++){\r\n            scanf(\"%d\",&a[i]);\r\n            update(1,1,maxn-1,a[i],1);\r\n        }\r\n        for(int i=1;i<=m;i++){\r\n            scanf(\"%d\",&b[i]);\r\n            update(1,1,maxn-1,b[i],-1);\r\n        }\r\n        cin>>q;\r\n        while(q--){\r\n            int op,pos,val;\r\n            scanf(\"%d%d%d\",&op,&pos,&val);\r\n            if(op==1){\r\n                update(1,1,maxn-1,a[pos],-1);\r\n                update(1,1,maxn-1,a[pos]=val,1);\r\n            }else{\r\n                update(1,1,maxn-1,b[pos],1);\r\n                update(1,1,maxn-1,b[pos]=val,-1);\r\n            }\r\n            \r\n            if(maxx[1]<=0)puts(\"-1\");\r\n            else printf(\"%d\\n\",query(1,1,maxn-1,{0,0}));\r\n\r\n        }\r\n    }\r\n}\r\n```\r\n', 'admin001', '2020-06-04 23:11:08', 'codeforces 1180E Serge and Dining Room 线段树', '1');
INSERT INTO `blog` VALUES ('9', '[题目传送门](http://acm.hdu.edu.cn/showproblem.php?pid=6183)\r\n# 题目大意：\r\n\r\n　　有多次操作。操作0是清空二维平面的点，操作1是往二维平面（x,y）上放一个颜色为c的点，操作2是查询一个贴着y轴的矩形内有几种颜色的点，操作3退出程序。\r\n\r\n# 思路：\r\n\r\n　　由于查询的矩形是贴着y轴的，所以以y轴为线段树节点，建立52颗线段树，然后每个节点都保存这个纵坐标下x的最小值，然后查询。\r\n\r\n　　这样的线段树显然是开不下的，所以我们考虑线段树动态开点，但是发现有50颗，如果按照50*n*logn的查询，还是会TLE，这里需要一个减枝，就是如果一部分区间内已经有一个颜色了，就直接退出所有查询即可，否则会TLE（卡常数？）\r\n\r\n# CODE\r\n```c++\r\n#include<bits/stdc++.h>\r\n#define clr(a,b) memset(a,b,sizeof(a))\r\nusing namespace std;\r\ntypedef long long ll;\r\nconst int inf=0x3f3f3f3f;\r\nconst int maxn=100005;\r\nint rt[52],tot;\r\nint R[maxn*20],L[maxn*20],v[maxn*20],flag;\r\nint op,x,y,y1,y2,co;\r\nvoid init(){\r\n    tot=0,clr(rt,0);\r\n}\r\nvoid update(int &o,int l,int r,int y,int x){\r\n    if(!o){\r\n        L[o=++tot]=0,R[o]=0;\r\n        v[o]=x;\r\n    }\r\n    v[o]=min(v[o],x);\r\n    if(l==r)return;\r\n    int mid=(l+r)>>1;\r\n    if(y<=mid)update(L[o],l,mid,y,x);\r\n    else update(R[o],mid+1,r,y,x);\r\n}\r\nvoid query(int o,int l,int r,int ql,int qr){\r\n    if(flag||!o){\r\n        return ;\r\n    }\r\n    if(ql<=l&&qr>=r)\r\n    {\r\n     if(v[o]<=x)flag=1;\r\n     return;\r\n    }\r\n    int mid=(l+r)>>1;\r\n    \r\n    if(ql<=mid)query(L[o],l,mid,ql,qr);\r\n    if(qr>mid)query(R[o],mid+1,r,ql,qr);\r\n    return ;\r\n}\r\nint main(){\r\n//    freopen(\"simple.in\",\"r\",stdin);\r\n    int n=1e6;\r\n    while(scanf(\"%d\",&op)!=EOF){\r\n        if(op==3)break;\r\n        else if(op==0){\r\n            init();\r\n        }else if(op==1){\r\n            scanf(\"%d%d%d\",&x,&y,&co);\r\n            update(rt[co],1,n,y,x);\r\n        }else{\r\n            scanf(\"%d%d%d\",&x,&y1,&y2);\r\n            int ans=0;\r\n            for(int i=0;i<=50;i++)\r\n            {\r\n                flag=0;\r\n                query(rt[i],1,n,y1,y2);\r\n                ans+=flag;\r\n            }\r\n            printf(\"%d\\n\",ans);\r\n        }\r\n    }\r\n}\r\n```\r\n', 'admin001', '2020-06-04 23:13:11', 'hdu6183 Color it 线段树动态开点+查询减枝', '1');
INSERT INTO `blog` VALUES ('14', '# 思路：\r\n\r\n　　区间合并线段树的题，第一次写，对于一颗子树，无论这个子树怎么交换，都不会对其他子树的逆序对造成影响，所以就直接算逆序对就好。\r\n\r\n　　注意叶子节点是1到n的全排列，所以每个权值都只会出现1次，合并很好写。\r\n\r\n　　注意动态开点，最多n个叶子节点，然后每次查询用到log个子树节点，（这句话似乎有语病）所以要开nlogn的空间。\r\n```c++\r\n#include<bits/stdc++.h>\r\n#define clr(a,b) memset(a,b,sizeof(a))\r\n#define fpn() freopen(\"simple.in\",\"r\",stdin)\r\nusing namespace std;\r\ntypedef long long ll;\r\nconst int inf=0x3f3f3f3f;\r\nconst int maxn=200005;\r\nint n,q,tot,r,k,cnt;\r\nint R[maxn*30],rt[maxn*30],L[maxn*30],val[maxn*30],ch[maxn*30][2];\r\nll sum[maxn*30],ans,anl,anr;\r\nvoid read(int &r){\r\n    r=++tot;\r\n    scanf(\"%d\",&val[r]);\r\n    if(!val[r]){\r\n        read(ch[r][0]);\r\n        read(ch[r][1]);\r\n    }\r\n}\r\nvoid pushup(int x){\r\n    sum[x]=sum[L[x]]+sum[R[x]];\r\n}\r\nvoid insert(int &x,int l,int r,int p){\r\n    x=++cnt;\r\n    int mid=(l+r)>>1;\r\n    if(l==r){\r\n        sum[x]=1;\r\n        return;\r\n    }\r\n    if(p<=mid)insert(L[x],l,mid,p);\r\n    else insert(R[x],mid+1,r,p);\r\n    pushup(x);\r\n}\r\nint merge(int x,int y){\r\n    if(!x)return y;\r\n    if(!y)return x;\r\n    anl+=sum[L[x]]*sum[R[y]];\r\n    anr+=sum[L[y]]*sum[R[x]];\r\n    L[x]=merge(L[x],L[y]);\r\n    R[x]=merge(R[x],R[y]);\r\n    pushup(x);\r\n    return x;\r\n}\r\nll dfs(int x){\r\n    ll ans=0;\r\n    if(!val[x]){\r\n    \r\n        ans+=dfs(ch[x][0])+dfs(ch[x][1]);\r\n        anl=anr=0;\r\n        rt[x]=merge(rt[ch[x][0]],rt[ch[x][1]]);\r\n        ans+=min(anl,anr);\r\n    }else{\r\n        insert(rt[x],1,n,val[x]);\r\n    }\r\n    return ans;\r\n}\r\nint main(){\r\n    scanf(\"%d\",&n);\r\n    read(r);\r\n    ans=dfs(1);\r\n    cout<<ans<<endl;\r\n}\r\n```\r\n', 'admin001', '2020-06-04 23:19:47', 'bzoj2212 Tree Rotations 线段树合并+动态开点', '1');
INSERT INTO `blog` VALUES ('19', '# 题目大意：\r\n\r\n　　给出2^k大小的白色矩形，q次操作,每次将一行或者一列颜色反转，问总体矩阵的价值，矩阵的价值定义是，如果整个矩阵颜色相同，价值为1，否则就把这个矩阵切成四份，价值为四个小矩阵的总价值加一。\r\n\r\n# 思路：\r\n\r\n　　结论是，ans=不同色的子矩阵数*4+1，用数学归纳法证明。具体看 大佬的博客 。然后用线段树维护这些，但是这个猜结论和线段树都很牛逼，都是看大佬的博客学习的，我的代码里加了一些注释，很神奇的题目。\r\n\r\n```c++\r\n#include<bits/stdc++.h>\r\n#define CLR(a,b) memset(a,b,sizeof(a))\r\nusing namespace std;\r\ntypedef long long ll;\r\nconst int inf=0x3f3f3f3f;\r\nconst int maxn=(1<<20) +10;\r\nll sum,tmp;\r\nll seg[2][maxn<<2],ans[2][21];//ans表示2^k的行（列）有几个同色的 \r\nint k,q;\r\ninline void mode(int id,int o,int l,int r,int x,int dep){\r\n    if(l==r){//染色 \r\n        seg[id][o]^=1;\r\n        return ;\r\n    }\r\n    int mid=(l+r)>>1;\r\n    if(x<=mid){\r\n        mode(id,(o<<1),l,mid,x,dep+1);\r\n    }else{\r\n        mode(id,(o<<1)|1,mid+1,r,x,dep+1);\r\n    }\r\n    if(seg[id][o]!=-1)ans[id][dep]--;  //当成不合法行，先减去 \r\n    if(seg[id][o<<1]==seg[id][(o<<1)|1])seg[id][o]=seg[id][o<<1];//如果左右状态一样 则转移（0,1，-1） \r\n    else seg[id][o]=-1;\r\n    if(seg[id][o]!=-1)ans[id][dep]++;//仍然合法，加上 \r\n    return ;\r\n}\r\nint main(){\r\n    cin>>k>>q;\r\n    ll n=(1<<k);\r\n    //sum表示总矩阵数  tmp表示合法数 \r\n    for(int i=0;i<k;i++)\r\n    {\r\n        ans[0][i+1]=ans[1][i+1]=1ll*1<<i;\r\n        sum+=1ll<<(i*2);\r\n    }\r\n    \r\n    while(q--)\r\n    {\r\n        int op,x;\r\n        scanf(\"%d%d\",&op,&x);\r\n        \r\n        mode(op,1,1,n,x,1); \r\n        tmp=0;\r\n        for(int i=0;i<=k;i++)\r\n        {\r\n            tmp+=ans[0][i]*ans[1][i];\r\n        }\r\n        printf(\"%lld\\n\",(sum-tmp)*4+1);\r\n    }\r\n}\r\n```\r\n', 'admin001', '2020-06-04 23:24:33', 'gym101964G Matrix Queries seerc2018g题 数学归纳法+线段树（递归）', '1');
INSERT INTO `blog` VALUES ('20', '# 题目大意：\r\n给出一颗树，根节点是0，有两种操作，一是修改某个节点的value，二是查询，从根节点出发，经过 x 节点的路径的最大值。\r\n\r\n# 思路：\r\n用树状数组写发现还是有些麻烦，最后用线段树了。\r\n\r\n　　　其实这道题的查询，就是查询从根节点到x节点+x节点走下去的路径的最大值，这样会发现，其实就是查询包括x节点的所有子树中权值最大的那个，而包括x节点的子树，如果用dfs序转换一下的话，可以在线段上用一段连续的点表示出来，所以最后就转换成了线段树区间求最大值，然后单点修改的题目了。\r\n\r\n　　要注意的是dfs序和原标号的对应，有一个地方弄反了，卡了好久。\r\n```c++\r\n#pragma comment(linker, \"/STACK:1024000000,1024000000\") \r\n#include<cstdio>\r\n#include<cstring>\r\n#include<stdlib.h>\r\n#include<algorithm>\r\n#include<iostream>\r\n#include<cmath>\r\n#include<map>\r\n#define CLR(a,b) memset(a,b,sizeof(a))\r\n#define PI acos(-1)\r\n#define lson rt*2,l,(l+r)/2\r\n#define rson rt*2+1,(l+r)/2+1,r\r\nusing namespace std;\r\ntypedef long long ll;\r\nconst int inf=0x3f3f3f3f;\r\nconst int maxn=100010;\r\nstruct edge{\r\n    int to,Next;\r\n}e[maxn*2];\r\nint tot,m,n,head[maxn],pos,dfn[maxn],fa[maxn],son[maxn],l[maxn],r[maxn];\r\nll val[maxn],dis[maxn];\r\ninline void init(){\r\n    CLR(head,-1),tot=0,pos=0;\r\n    CLR(dis,0);\r\n    fa[1]=1;\r\n}\r\ninline void addv(int u,int v){\r\n    e[++tot]={v,head[u]};\r\n    head[u]=tot;\r\n}\r\nll tree[maxn << 2], laz[maxn << 2];\r\ninline void pushup(int rt) {\r\n    tree[rt] = max(tree[rt << 1], tree[rt << 1 | 1]);\r\n}\r\ninline void pushdown(int rt) {\r\n    if (laz[rt]) {\r\n        tree[rt << 1] += laz[rt];\r\n        tree[rt << 1 | 1] += laz[rt];\r\n        laz[rt << 1] += laz[rt];\r\n        laz[rt << 1 | 1] += laz[rt];\r\n        laz[rt] = 0;\r\n    }\r\n}\r\ninline void build(int rt, int l, int r) {\r\n    laz[rt] = 0;\r\n    if (l == r) {\r\n        tree[rt] = dis[l];\r\n        return ;\r\n    }\r\n    build(lson);\r\n    build(rson);\r\n    pushup(rt);\r\n}\r\ninline void update(int L, int R, ll v, int rt, int l, int r) {\r\n    if (L <= l && R >= r) {\r\n        tree[rt] += v;\r\n        laz[rt] += v;\r\n        return;\r\n    }\r\n    pushdown(rt);\r\n    if (L <= (l + r) / 2)   update(L, R, v, lson);\r\n    if (R > (l + r) / 2)    update(L, R, v, rson);\r\n    pushup(rt);\r\n}\r\ninline ll query(int L, int R, int rt, int l, int r) { \r\n    if (L <= l && R >= r) {\r\n        return tree[rt];\r\n    }\r\n    pushdown(rt);\r\n    if (L > (l + r) / 2)    return query(L,R,rson);\r\n    else if (R <= (l + r) / 2)  return query(L,R,lson);\r\n    else return max(query(L,R,lson),query(L,R,rson));\r\n}\r\n\r\ninline void dfs(int u,int pre){\r\n    dfn[u]=++pos;\r\n    l[u]=pos;\r\n    son[u]=1;\r\n    dis[dfn[u]]=dis[dfn[pre]]+val[u];\r\n    for(int i=head[u];i!=-1;i=e[i].Next)\r\n    {\r\n        int v=e[i].to;\r\n        if(v==fa[u])continue;\r\n        fa[v]=u;\r\n        \r\n        dfs(v,u);\r\n        son[u]+=son[v];\r\n    }\r\n    r[u]=pos;\r\n}\r\nint main(){\r\n    int T,cas=1;\r\n    cin>>T;\r\n    while(T--){\r\n        init();\r\n        scanf(\"%d%d\",&n,&m);\r\n        \r\n        for(int i=1;i<n;i++){\r\n            int u,v;\r\n            scanf(\"%d%d\",&u,&v);\r\n            addv(u+1,v+1);\r\n            addv(v+1,u+1);\r\n        }\r\n        \r\n        for(int i=1;i<=n;i++)scanf(\"%lld\",&val[i]);\r\n        dfs(1,1);\r\n        build(1,1,n);\r\n        printf(\"Case #%d:\\n\",cas++);\r\n        while(m--){\r\n            int op,x;ll y;\r\n            scanf(\"%d%d\",&op,&x);\r\n            if(op==1){\r\n            //    printf(\"debug  %d  %d\\n\",dfn[x+1],dfn[x+1]+son[x+1]-1);\r\n            \r\n                printf(\"%lld\\n\",query(l[x+1],r[x+1],1,1,n));\r\n            }else{\r\n                scanf(\"%lld\",&y);\r\n                update(l[x+1],r[x+1],y-val[x+1],1,1,n);\r\n                val[x+1]=y;\r\n            }\r\n        }\r\n        \r\n    }\r\n}\r\n```\r\n', 'admin001', '2020-06-04 23:26:33', 'hdu5692 Snacks dfs序+线段树', '1');
INSERT INTO `blog` VALUES ('21', '# 题目大意：\r\n给出一棵树，1为根节点，每个节点都有权值，每个叶子节点都是一个游戏的结局，选择k个游戏结局，使得权值总和最大，同一个节点不会被重复计算。\r\n\r\n# 思路：\r\n这道题最关键的是要想到一个性质，就是不管怎么选，当前子树中，叶子节点最重的那一条链肯定要被选择。（可以反证，如果不选这条链，一定不是最优的），那么贪心的想一下，选取这条链之后，把这条链上的所有节点权值变成0，得到的新的树，重复以上过程k次，就得到了我们要的答案。\r\n\r\n　　要怎么把链节点的权值变成0呢？我们建立线段树的时候，把以每个节点当成末尾节点的链当成一个元素，用这个节点的dfs序当成线段树的序号，做一个可以区间修改，查询最大值并返回下标的线段树，这样每次查询（1,n）区间最大值，就是当前最重的链，得到链后，要把这条链上每一个节点都赋值为0，并且更新其他相关链的信息。我们发现，把一个节点赋值为0，其实就是把这个节点的子树都减去此节点权值，那么就用dfs序进行区间减处理，并且把每个节点是否被删去都标记一下。如果这条链往上走的节点已经被清空了，就不需要再往上走了。这样我们会发现，每个节点最多被删除一次，每一次修改的时间复杂度是logn，所以总复杂度是nlogn，和 k 几乎无关。注意dfs序和原下标的对应。\r\n\r\n上代码（bzoj iostream头文件居然ce了。。）\r\n```c++\r\n#include<cstdio>\r\n#include<cstring>\r\n#include<stdlib.h>\r\n#include<cstdio>\r\n#include<algorithm>\r\n//#include<iostream>\r\n#include<map>\r\n#include<queue>\r\n#include<vector>\r\n#define CLR(a,b) memset(a,b,sizeof(a))\r\n#define lson l , mid , x << 1\r\n#define rson mid + 1 , r , x << 1 | 1\r\n#define PI acos(-1)\r\nusing namespace std;\r\ntypedef long long ll;\r\nconst int inf=0x3f3f3f3f;\r\nconst int maxn=200010;\r\nstruct edge{\r\n    int to,Next;\r\n}e[2*maxn];\r\nint n,m;\r\nint tot,head[maxn],u,v,L[maxn],R[maxn],time,dfn[maxn],fa[maxn],ref[maxn];\r\nll val[maxn],dis[maxn];\r\nbool vis[maxn];\r\ninline void init(){\r\n    CLR(head,-1),tot=0,time=0;\r\n    CLR(val,0);\r\n    dis[0]=0;\r\n    CLR(vis,0);\r\n}\r\nll mx[maxn << 2] , tag[maxn << 2],mp[ maxn << 2];\r\n\r\ninline void pushup(int x)\r\n{\r\n    int l = x << 1 , r = x << 1 | 1;\r\n    if(mx[l] > mx[r]) mx[x] = mx[l] , mp[x] = mp[l];\r\n    else mx[x] = mx[r] , mp[x] = mp[r];\r\n}\r\ninline void pushdown(int x)\r\n{\r\n    if(tag[x])\r\n    {\r\n        int l = x << 1 , r = x << 1 | 1;\r\n        mx[l] -= tag[x] , mx[r] -= tag[x];\r\n        tag[l] += tag[x] , tag[r] += tag[x];\r\n        tag[x] = 0;\r\n    }\r\n}\r\ninline void build(int l , int r , int x)\r\n{\r\n    if(l == r)\r\n    {\r\n        mx[x] = dis[l] , mp[x] = l;\r\n        return;\r\n    }\r\n    int mid = (l + r) >> 1;\r\n    build(lson) , build(rson);\r\n    pushup(x);\r\n}\r\ninline void update(int b , int e , ll a , int l , int r , int x)\r\n{\r\n    if(b <= l && r <= e)\r\n    {\r\n        mx[x] -= a , tag[x] += a;\r\n        return;\r\n    }\r\n    pushdown(x);\r\n    int mid = (l + r) >> 1;\r\n    if(b <= mid) update(b , e , a , lson);\r\n    if(e > mid) update(b , e , a , rson);\r\n    pushup(x);\r\n}\r\n\r\ninline void addv(int u,int v){\r\n    e[++tot]={v,head[u]};\r\n    head[u]=tot;\r\n}\r\n\r\ninline void dfs(int u,int pre){\r\n    fa[u]=pre;\r\n    dfn[++time]=u;\r\n    ref[u]=time;\r\n    L[u]=time;\r\n    dis[time]=val[u]+dis[ref[pre]];\r\n    for(int i=head[u];i!=-1;i=e[i].Next)\r\n    {\r\n        int v=e[i].to;\r\n        if(v==pre)continue;\r\n        dfs(v,u);\r\n    }\r\n    R[u]=time;\r\n}\r\nint main(){\r\n    int k;\r\n    while(scanf(\"%d%d\",&n,&k)!=EOF)\r\n    {\r\n        init();\r\n        for(int i=1;i<=n;i++)\r\n        {\r\n            scanf(\"%lld\",&val[i]);\r\n        }\r\n        for(int i=1;i<n;i++)\r\n        {\r\n            scanf(\"%d%d\",&u,&v);\r\n            addv(u,v);\r\n            addv(v,u);\r\n        }\r\n        \r\n        dfs(1,0);\r\n        build(1,n,1);\r\n        ll ans=0;\r\n        int x;\r\n    \r\n        while(k--)\r\n        {\r\n            ans+=mx[1],x=mp[1];\r\n            while(x && !vis[x])\r\n            {\r\n                update(L[dfn[x]],R[dfn[x]],val[dfn[x]],1,n,1);\r\n                vis[x]=1;\r\n                x=ref[fa[dfn[x]]];\r\n                \r\n            }\r\n        }\r\n        printf(\"%lld\\n\",ans);\r\n        \r\n    }\r\n}\r\n\r\n```\r\n', 'admin001', '2020-06-04 23:28:45', 'bzoj3252 攻略 dfs序+线段树', '1');
INSERT INTO `blog` VALUES ('22', '$<u,v>$\r\n\r\n$<u,v>$\r\n\r\n$<u,v>$\r\n\r\n$<u,v>$', 'admin001', '2020-06-04 23:31:45', '111', '2');
INSERT INTO `blog` VALUES ('23', '题意：\r\n　　给定一棵n个点的边权为0或1的树，一条合法的路径(x,y)(x≠y)满足，从x走到y，一旦经过边权为1的边，就不能再经过边权为0的边，求有多少边满足条件？\r\n\r\n思路：\r\n\r\n　　首先这道题，换根dp也可以过（树形dp，点这里）\r\n\r\n　　那么如何并查集做呢，我们考虑一个点u\r\n，我们将与u通过0边相连的连通点的数量记做siz0，将与u通过1边相连的连通点的数量记做siz1，那么所有符合条件的0-1边将u作为转折点的，0-0边将u作为终点的，1-1边将u作为终点的边的数量就等于siz0∗siz1−1\r\n\r\n，减去的1就是自己连到自己。\r\n\r\n　　用并查集维护上面的信息，即f[u][0]\r\n表示u的0边祖先，f[u][0]表示u的1边祖先，然后merge即可。', 'admin001', '2020-06-04 23:34:43', 'codeforces1156D 0-1-Tree 并查集', '1');
INSERT INTO `blog` VALUES ('24', '111', 'test001', '2020-06-04 23:37:31', '111', '1');
INSERT INTO `blog` VALUES ('25', '![img_0176.png](1)', 'admin001', '2020-06-04 23:42:46', '11', '3');
INSERT INTO `blog` VALUES ('26', '![1.png](1)', 'admin001', '2020-06-05 11:15:46', '123123', '1');
INSERT INTO `blog` VALUES ('27', '**Bezier 曲线原理**\nBezier 曲线的原理我参考了这篇博客：https://www.cnblogs.com/hyb1/p/3875468.html。\nBezier 曲线是应用于二维图形的曲线。曲线由顶点和控制点组成，通过改变控制点坐标可以改变曲线的形状。\n**OpenGL 实现思路**\n在 OpenGL 窗口中，我们希望能通过左键点击窗口添加 Bezier 曲线的控制点，右键点击则对当前添加的最后一个控制点进行消除。然后根据鼠标绘制的控制点实时更新 Bezier 曲线。\n\n捕获鼠标点击时的坐标\n我们需要用一个回调函数，该函数是在鼠标移动时不断获取鼠标在窗口的坐标。\n\n首先我们要声明全局的鼠标位置变量，代码如下：\n```\nfloat mouseXPos, mouseYPos;			\n```\n然后在鼠标事件中不断更新全局位置变量的值。代码如下：\n```\nvoid cursor_position_callback(GLFWwindow* window, double x, double y) { \n	mouseXPos = float((x - WINDOW_WIDTH / 2) / WINDOW_WIDTH) * 2;\n	mouseYPos = float(0 - (y - WINDOW_HEIGHT / 2) / WINDOW_HEIGHT) * 2;\n	return; \n}\n```\n根据顶点画出连续的线段\n前面我们获取的鼠标的当前位置，那么当鼠标点击左键时，我们要捕获该点击事件，将顶点数据添加到 lineVertices 并通过绑定 VAO 画出线段。\n\n先声明全局的顶点数据变量：\n```\n// 声明全局顶点变量, 点个数为 vertexLen / 3\nint lineVertexLen = 0;\nfloat lineVertices[MAX_VERTEX_LEN] = {\n	//位置\n	//-0.5f, 0.5f, 0.0f\n};\n```\n然后再鼠标点击事件中操作：\n```\nvoid mouse_button_callback(GLFWwindow* window, int button, int action, int mods) { \n	if (action == GLFW_PRESS) switch (button) { \n		case GLFW_MOUSE_BUTTON_LEFT:			\n			// 每隔两个点画一条直线\n			// 鼠标点击的点\n			lineVertices[lineVertexLen] = mouseXPos;\n			lineVertexLen++;\n			lineVertices[lineVertexLen] = mouseYPos;\n			lineVertexLen++;\n			lineVertices[lineVertexLen] = 0.0f;\n			lineVertexLen++;\n			// 添加索引,前一个点也新的点一起确定新线段\n			if (lineIndicesLen >= 2) {\n				lineIndices[lineIndicesLen] = lineIndices[lineIndicesLen - 1];\n				lineIndicesLen++;\n				lineIndices[lineIndicesLen] = lineIndices[lineIndicesLen - 1] + 1;\n				lineIndicesLen++;\n			}\n			else {\n				lineIndices[lineIndicesLen] = lineIndicesLen;\n				lineIndicesLen++;\n			}\n			break;\n		default:				\n			break;\n	}	\n	return; \n}\n```\n之后便是通过 VAO、VBO 和 GL_LINES 等画出线段。', 'test001', '2020-06-05 12:51:46', '利用 OpenGL 绘制 Bezier 贝塞尔曲线', '1');
INSERT INTO `blog` VALUES ('28', '# hello word\n', 'test001', '2020-06-06 16:47:47', '测试博文', '2');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `user_id` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '用户ID',
  `blog_id` int(11) NOT NULL COMMENT '被评论的博客ID',
  `content` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '评论内容',
  `time` datetime NOT NULL COMMENT '评论发布时间',
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `blog_id` (`blog_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户评论博客表，记录用户对博客的评论信息';

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('5', 'test001', '24', '111', '2020-06-04 23:37:59');
INSERT INTO `comment` VALUES ('6', 'test001', '24', '111', '2020-06-04 23:38:02');
INSERT INTO `comment` VALUES ('7', 'test001', '9', '解题思路清晰，对我太有帮助了！！！', '2020-06-05 13:07:24');
INSERT INTO `comment` VALUES ('8', 'test001', '9', '谢谢思路', '2020-06-06 16:46:20');

-- ----------------------------
-- Table structure for `file`
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `file_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '博客资源文件路径',
  `uploader_id` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '博客资源文件上传者ID',
  `real_name` varchar(256) COLLATE utf8_bin NOT NULL COMMENT '文件原名',
  `description` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`file_name`),
  KEY `uploader_id` (`uploader_id`),
  CONSTRAINT `file_ibfk_1` FOREIGN KEY (`uploader_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='博客资源文件表，记录博客资源文件的信息';

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES ('123123', 'test001', '00000.txt', '');
INSERT INTO `file` VALUES ('123132.txt', 'test001', '123132.txt', null);
INSERT INTO `file` VALUES ('3c24e139ba5c4ecea66969777bfdca37.jpg', 'test001', '2decc2ccf67c34eaa01885f9ee0065e3.jpg', null);
INSERT INTO `file` VALUES ('5ba1889e892e48b0a4680e40cee8cc59.png', 'test001', '1.png', null);
INSERT INTO `file` VALUES ('b6083144cce84eb0bd80c1cfe7b3063d.sql', 'admin001', 'hsdn.sql', null);
INSERT INTO `file` VALUES ('bb61aff548ac466cbba646585842bc44.jpg', 'admin001', '58097f73af304.jpg', null);
INSERT INTO `file` VALUES ('d0d8d9aa1a1a4086aa590bdcb71ba1c6.jpg', 'admin001', '长安市手绘插画4k壁纸_彼岸图网.jpg', null);
INSERT INTO `file` VALUES ('d0e0dc3d2594483a9018654fd725ae1e.txt', 'admin001', '963.txt', null);
INSERT INTO `file` VALUES ('e302b429a7034a7a94e70fd9fc32f0c0.jpg', 'admin001', '738b4710b912c8fc35961175fd039245d6882125.jpg', null);
INSERT INTO `file` VALUES ('study.txt', 'test002', '1111.txt', '');

-- ----------------------------
-- Table structure for `follow`
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `noticer` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '关注者的用户ID',
  `follower` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '被关注者的用户ID',
  PRIMARY KEY (`noticer`,`follower`),
  KEY `follower` (`follower`),
  CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`noticer`) REFERENCES `user` (`user_id`),
  CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`follower`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户关注表，记录用户的关注信息';

-- ----------------------------
-- Records of follow
-- ----------------------------
INSERT INTO `follow` VALUES ('admin001', 'admin001');
INSERT INTO `follow` VALUES ('test001', 'admin001');
INSERT INTO `follow` VALUES ('test002', 'admin001');
INSERT INTO `follow` VALUES ('test005', 'admin001');
INSERT INTO `follow` VALUES ('admin001', 'test001');
INSERT INTO `follow` VALUES ('test002', 'test001');
INSERT INTO `follow` VALUES ('admin001', 'test002');
INSERT INTO `follow` VALUES ('test001', 'test002');
INSERT INTO `follow` VALUES ('test001', 'test003');

-- ----------------------------
-- Table structure for `letter`
-- ----------------------------
DROP TABLE IF EXISTS `letter`;
CREATE TABLE `letter` (
  `letter_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '私信ID',
  `content` varchar(8191) COLLATE utf8_bin NOT NULL COMMENT '私信内容',
  `recipient_id` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '收件人ID',
  `sender_id` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '发件人ID',
  `time` datetime NOT NULL COMMENT '私信发送时间',
  PRIMARY KEY (`letter_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `sender_id` (`sender_id`),
  CONSTRAINT `letter_ibfk_1` FOREIGN KEY (`recipient_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `letter_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='私信表，记录私信信息';

-- ----------------------------
-- Records of letter
-- ----------------------------
INSERT INTO `letter` VALUES ('1', 'content_', 'test003', 'test002', '2020-05-05 09:18:32');
INSERT INTO `letter` VALUES ('2', '123123', 'test003', 'test001', '2020-05-21 19:18:40');
INSERT INTO `letter` VALUES ('3', '999999', 'test002', 'test001', '2020-05-21 19:43:19');
INSERT INTO `letter` VALUES ('4', '000000', 'test003', 'test002', '2020-05-31 20:36:05');
INSERT INTO `letter` VALUES ('5', '奥术大师d', 'test002', 'test001', '2020-06-04 20:25:53');
INSERT INTO `letter` VALUES ('6', '中午吃外卖', 'test002', 'test001', '2020-06-05 11:17:31');
INSERT INTO `letter` VALUES ('7', '好啊', 'test001', 'test002', '2020-06-05 12:09:26');
INSERT INTO `letter` VALUES ('8', '123123', 'admin001', 'test005', '2020-06-05 17:46:12');
INSERT INTO `letter` VALUES ('9', 'hello', 'admin001', 'test001', '2020-06-06 11:39:12');
INSERT INTO `letter` VALUES ('10', 'hello too', 'test001', 'admin001', '2020-06-06 11:39:33');
INSERT INTO `letter` VALUES ('11', '你好', 'admin001', 'test001', '2020-06-06 16:46:33');
INSERT INTO `letter` VALUES ('12', '你好', 'test003', 'test001', '2020-06-06 16:46:46');
INSERT INTO `letter` VALUES ('13', '你好呀', 'admin001', 'test001', '2020-06-06 18:12:19');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `content` varchar(8191) COLLATE utf8_bin NOT NULL COMMENT '公告内容',
  `user_id` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '发表该公告的管理员ID',
  `time` datetime NOT NULL COMMENT '公告发布时间',
  PRIMARY KEY (`notice_id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='公告表，记录公告的信息';

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', 'content_', 'admin001', '2020-05-08 11:38:24');
INSERT INTO `notice` VALUES ('2', '99999', 'admin001', '2020-05-21 22:06:08');
INSERT INTO `notice` VALUES ('3', '0000000', 'admin002', '2020-05-21 22:07:35');
INSERT INTO `notice` VALUES ('4', '0000000', 'admin001', '2020-05-21 22:07:59');
INSERT INTO `notice` VALUES ('5', '公告', 'admin001', '2020-06-04 23:19:50');
INSERT INTO `notice` VALUES ('6', '111', 'admin001', '2020-06-04 23:47:03');
INSERT INTO `notice` VALUES ('7', '公告2', 'admin001', '2020-06-04 23:52:17');
INSERT INTO `notice` VALUES ('8', 'lwbhaoshuai', 'admin001', '2020-06-06 11:39:30');
INSERT INTO `notice` VALUES ('9', '发布公告', 'admin001', '2020-06-06 16:48:29');

-- ----------------------------
-- Table structure for `praise`
-- ----------------------------
DROP TABLE IF EXISTS `praise`;
CREATE TABLE `praise` (
  `user_id` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '用户ID',
  `blog_id` int(11) NOT NULL COMMENT '博文编号',
  PRIMARY KEY (`user_id`,`blog_id`),
  KEY `blog_id` (`blog_id`),
  CONSTRAINT `praise_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `praise_ibfk_2` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='博客点赞表，记录博客的点赞信息';

-- ----------------------------
-- Records of praise
-- ----------------------------
INSERT INTO `praise` VALUES ('admin001', '9');
INSERT INTO `praise` VALUES ('test001', '9');
INSERT INTO `praise` VALUES ('test002', '9');
INSERT INTO `praise` VALUES ('admin001', '28');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '用户ID',
  `password` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '用户的密码',
  `type` tinyint(1) NOT NULL COMMENT '用户类型 0普通用户 1管理员',
  `sex` int(11) NOT NULL DEFAULT '1' COMMENT '性别',
  `phone_number` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号码',
  `nickname` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '昵称',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表，记录用户的信息';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admin001', '202CB962AC59075B964B07152D234B70', '1', '1', '12345678977', 'Admin001', '0');
INSERT INTO `user` VALUES ('test001', '202CB962AC59075B964B07152D234B70', '0', '1', null, 'Test001', '0');
INSERT INTO `user` VALUES ('test002', '202CB962AC59075B964B07152D234B70', '0', '0', '13854589657', 'Test002', '0');
INSERT INTO `user` VALUES ('test003', '202CB962AC59075B964B07152D234B70', '0', '1', '21313213322', 'Test003', '0');
INSERT INTO `user` VALUES ('test005', '202CB962AC59075B964B07152D234B70', '0', '1', '123123123', 'Test005', '0');
INSERT INTO `user` VALUES ('zxc', '202CB962AC59075B964B07152D234B70', '0', '1', '13478912366', 'Zxc', '0');

-- ----------------------------
-- Table structure for `user_download_file`
-- ----------------------------
DROP TABLE IF EXISTS `user_download_file`;
CREATE TABLE `user_download_file` (
  `user_id` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '用户ID',
  `file_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '博客资源文件名',
  PRIMARY KEY (`user_id`,`file_name`),
  KEY `file_name` (`file_name`) USING BTREE,
  CONSTRAINT `user_download_file_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_download_file_ibfk_2` FOREIGN KEY (`file_name`) REFERENCES `file` (`file_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户下载文件表，记录用户下载的文件';

-- ----------------------------
-- Records of user_download_file
-- ----------------------------
INSERT INTO `user_download_file` VALUES ('test001', '123123');
INSERT INTO `user_download_file` VALUES ('test001', 'study.txt');
