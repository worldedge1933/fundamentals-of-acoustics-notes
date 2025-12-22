
#set page(
	margin: (top: 18mm, bottom: 18mm, left: 16mm, right: 16mm),
	columns: 2,
)

#set page(background: context {
    // 正文区域宽度（不含左右页边距）
    let textw = page.width - page.margin.left - page.margin.right
    // gutter 的中线刚好在正文区域的 50% 处（两栏对称时）
    let x = page.margin.left + 0.5 * textw

    // 竖线从正文顶部到正文底部（不含上下页边距）
    let y = page.margin.top
    let h = page.height - page.margin.top - page.margin.bottom

    place(
        top + left,
        dx: x,
        dy: y,
        line(length: h, angle: 90deg, stroke: 0.5pt),
    )
})

#set page(
    numbering: "1",
    number-align: center + bottom,
)


#set text(size: 10.5pt)
#set par(justify: true, leading: 0.65em)

#show heading.where(level: 1): set block(below: 2em, above: 2em)
#show heading.where(level: 2): set block(below: 1.5em, above: 2em)
#show heading.where(level: 3): set block(below: 1.3em)

#show heading.where(level: 1): set text(fill: red)
#show heading.where(level: 2): set text(fill: blue, font: "Microsoft YaHei")
#show heading.where(level: 3): set text(weight: "regular")

#show heading.where(level: 1): it => [
    #colbreak(weak: true)
    #it
]

#let fig(path) = figure(
	image(path, width: 100%),
)

= Chapter 1: Introduction to vibrations

== 1. RMS & MS

RMS: root-mean-square.
MS: mean-square.

- R: root
- M: mean
- S: square

== 2. $hat(s)$

小帽子表示实数幅值

== 3. 单自由度系统

固有角频率：
$
omega_0 = sqrt(k / m)
$

== 4. 阻尼系统

$
-k x - beta ((dif x) / (dif t)) = m ((dif^2 x) / (dif t^2)) 
$

阻尼衰减项：
$
A = - beta / (2 m)
$

总：
$
e^(A t) e^(j t sqrt(omega_0^2 - A^2))
$

$omega_0$ 为无阻尼自由系统固有角频率：$omega_0 = sqrt(k / m)$

== 5. 受迫振动

受迫振动方程 (1.1)：
$
-k x - beta ((dif x) / (dif t)) + f(t) = m ((dif^2 x) / (dif t^2))
$

注意：式 (1.1) 中 $x(t)$ 和 $f(t)$ 方向同向；速度和力也在同方向。

设
$
f(t) = hat(f) e^(j Omega t),
quad
x(t) = hat(x) e^(j (Omega t + phi)).
$

=== (1) 求振幅

$
-k hat(x) e^(j (Omega t + phi)) - j beta Omega hat(x) e^(j (Omega t + phi)) + f(t) = -m Omega^2 hat(x) e^(j (Omega t + phi))
$

令
$
(k - m Omega^2 + j beta Omega) hat(x) e^(j (Omega t + phi)) = hat(f) e^(j Omega t)
$

因此
$
abs(hat(x)(Omega))
= abs(hat(f)) / abs(k - m Omega^2 + j beta Omega)
= abs(hat(f)) / sqrt((k - m Omega^2)^2 + (beta Omega)^2).
$

=== (2) 求相位

令
$
hat(x) e^(j(Omega t + phi)) = hat(f) e^(j Omega t) / (k - m Omega^2 + j beta Omega).
$

令 $t = 0$：
$
e^(j phi) = C (k - m Omega^2 - j beta Omega)
$

可得
$
tan(phi) = - (beta Omega) / (k - m Omega^2).
$

=== (3) 求阻抗

思路：把 (1.1) 中 $x(t)$ 都写成 $v(t)$ 的形式。

$
- (k / (j omega)) v(t) - beta v(t) + f(t) = j omega m v(t)
$

$
f(t) = v(t) (j omega m + k / (j omega) + beta)
$

定义
$
Z(omega) = f / v = j omega m + k / (j omega) + beta
$

=== (4) 求 $Q$ factor

$Q$ factor 描述功率为最大的一半时的 $Delta omega_m$（$Delta omega$：半功率带宽）。

$Delta omega$ 是因为有两个值满足条件，以下简称该条件为 $Q$ 点。

以驱动力幅值不变为条件。

半功率点：
$
P = P_max / 2
$

$
Z_min = abs(Z(omega_0)) = beta
$

$
abs(Z) = sqrt(2) abs(Z_min)
$

$
abs(j omega m + k / (j omega)) = beta
$

$
=> abs(j omega m - j k / omega) = beta
$

$
=> abs(omega m - k / omega) = beta
$

$
=> omega m - k / omega = plus.minus beta
$

1) 当 $omega m - k / omega = beta$：

$
m omega^2 - beta omega - k = 0
$

$
omega = (beta plus.minus sqrt(beta^2 + 4 k m)) / (2 m)
$

舍去负根：
$
omega_1 = (beta + sqrt(beta^2 + 4 k m)) / (2 m)
$

2) 当 $omega m - k / omega = - beta$：

$
m omega^2 + beta omega - k = 0
$

$
omega = (-beta plus.minus sqrt(beta^2 + 4 k m)) / (2 m)
$

类似舍去负根：
$
omega_2 = (-beta + sqrt(beta^2 + 4 k m)) / (2 m)
$

$
Delta omega = omega_1 - omega_2 = beta / m
$

$
Q = omega_0 / (Delta omega) = (m omega_0) / beta
$

== 6. 本章速记

1) 单振动系统：$omega_0 = sqrt(k / m)$

2) 阻尼：$A = - beta / (2 m)$，$e^(A t) e^(j t sqrt(omega_0^2 - A^2))$

3) 单振动系统阻抗：$j omega m + k / (j omega) + beta$

4) $Q$ factor：$(m omega_0) / beta$

\
= Chapter 2: Wave equation, vibrating strings and membranes

== 1. 从行波假设得到波动方程

1) 设行波形式：
$
f = f(x - v t).
$

波的本质：波形整体传播。在 $x - v t$ 中，$t$ 增加时，$x$ 也相应增加 $v t$，传播速度为 $v$。

2) 如何确定 $v$？

求导：


$
(partial^2 f) / (partial x^2) = f''(x - v t),
quad
(partial^2 f) / (partial t^2) = v^2 f''(x - v t).
$

所以：
$
(partial^2 f) / (partial x^2) = (1 / v^2) (partial^2 f) / (partial t^2).
$

对符合物理现实的模型，可分别计算 $(partial^2 f) / (partial x^2)$ 和 $(partial^2 f) / (partial t^2)$，从而得到 $v$。

== 2. 弦的一维波动方程（推导要点）

#fig("media/fa-fig-01.png")

对此情境，我们先做出三个假设：

1) 弦的张力 $T$ 恒定不变\
2) 小角度：$sin(theta) approx tan(theta) approx (partial y) / (partial x)$\
3) $dif m = mu dif x$

由 $F = m a$。对弦上一小段 $dif x$：

$
dif F =T sin(theta + dif theta) - T sin(theta)
$

由于假设(2)，

$
dif F = T (partial sin theta) / (partial x) dif x
=T ((partial^2 y) / (partial x^2)) dif x

$

又由牛顿第二定律得
$
mu dif x ((partial^2 y) / (partial t^2)) = T ((partial^2 y) / (partial x^2)) dif x \
=>
((partial^2 y) / (partial t^2)) = (T / mu) ((partial^2 y) / (partial x^2)).
$

相速度
$
v = sqrt(T / mu).
$



== 3. 弦的通解

弦上位移的一般形式：
$
y(x, t) = f_1(x - v t) + f_2(x + v t).
$
此式子表示两个方向上传播的波的叠加。
\

=== 1) 固定端：$y(0,t)=0$
#fig("media/fa-fig-02.png")
$
f_1(v t) + f_2(-v t) = 0
quad => quad
f_1(v t) = - f_2(-v t)
$

=== 2) 自由端：$((partial y) / (partial x))|_(x=0) = 0$
#fig("media/fa-fig-03.png")
$
f_1'(v t) + f_2'(-v t) = 0
quad => quad
f_2(v t) = f_1(-v t)
$




== 4. 简谐行波与波数

简谐行波可写为
$
y(x,t) = hat(A) e^(j(omega t - k x)) + hat(B) e^(j(omega t + k x)).
$

当使用简谐方程时，往往更关注频率而非波速。\
因此更换为 $t$ 本位。

其中 $k$ 称为 wave number。
$
omega / k = v
quad => quad
k = omega / v
$

另：wave number 的单位是 $1 / m$。

另一种定义 $k$ 的方式是：$k = (2 pi)/ lambda$

== 5. 弦上驻波（两端固定）

#fig("media/fa-fig-04.png")

假设波动方程：
$
y =& A sin(omega t - k x) + B cos(omega t - k x)\
  &+ C sin(omega t + k x) + D cos(omega t + k x)
$

$
y(0,t) = 0 quad => quad A = -C, B = -D
$

因此
$
y = &A [sin(omega t - k x) - sin(omega t + k x)]\

 &+ B [cos(omega t - k x) - cos(omega t + k x)]\

=& 2 [A cos(omega t) - 2 B sin(omega t)] sin(k x)
$

$
y(L,t) = 0
$

$
sin(k L) = 0
quad => quad
k L = n pi
$

所以
$
lambda_n = (2 L) / n,
quad
f_n = omega_n / (2 pi) = (n v) / (2 L)
$



== 6. 弦的输入阻抗

定义：
$
Z_"in" = f(t) / v(0,t)
$

=== (1) 自由端

#figure(image("media/fa-fig-05.png", width: 60%))

自由端无反射波：$y = tilde(A) e^(j (omega t - k x))$。

$
f(t) =& -T sin (theta) \
=& -T lr( ( ( (partial y) / (partial x)) mid(|) _(x=0)))\
=& -j T k tilde(A) e^(j (omega t - k x))
$

$
v(0,t) = (((partial y) / (partial t))|_(x=0)) = j omega tilde(A) e^(j (omega t - k x))
$

$
Z_"in" = f(t) / v(0,t) = (T k) / omega = T / v = sqrt(T mu)
$

记 $Z_0 = sqrt(T mu)$。

=== (2) 固定端
#figure(image("media/fa-fig-06.png", width: 60%))

固定端引起了反射波
$
y = tilde(A) e^(j(omega t - k x)) + tilde(B) e^(j(omega t + k x)).
$

固定端条件 $y(L,t)=0$ 给出

$
tilde(A) e^(j(omega t - k L)) + tilde(B) e^(j(omega t + k L)) = 0
$

$
tilde(B) = - tilde(A) e^(-j 2 k L)
$

又有
$
v(0,t) = j omega tilde(A) e^(j omega t) + j omega tilde(B) e^(j omega t)
$

$
f(t) = -T (((partial y) / (partial x))|_(x=0)) = -T (-j k tilde(A) e^(j omega t) + j k tilde(B) e^(j omega t))
$

则
$
Z_in = f(t) / v(0,t) = (Z_0 (tilde(A) - tilde(B))) / (tilde(A) + tilde(B))
$

代入 $tilde(B) = - tilde(A) e^(-j 2 k L)$：
$
Z_in =& Z_0 (1 + e^(-j 2 k L)) / (1 - e^(-j 2 k L))\

=& Z_0 (e^(j k L) + e^(-j k L)) / (e^(j k L) - e^(-j k L))
$

$
Z_"in" = - j Z_0 cot(k L).
$

== 7. 阻抗不连续处的反射与透射

#figure(image("media/fa-fig-07.png", width: 100%))

一列波 $psi_i$ 从左侧过来，遇到阻抗不连续处，产生透射波 $psi_t$，反射波 $psi_r$。

尽管图上似乎 $psi_i$ 和 $psi_r$ 是孤立的，但实际上它们是叠加在一起的。当 $psi_i$ 到达阻抗不连续处时，$psi_r$ 也同时存在，左侧的实际波形是 $psi_L = psi_i + psi_r$，牢记这一点！

在阻抗不连续处，有些东西必须连续：

1) 位移，因为弦没有断开\
2) 回复力，因为弦在此处不能有无限大的加速度

设
$
psi_L = psi_i + psi_r,
quad
psi_R = psi_t
$

于是
$
cases(
psi_L(0,t) = psi_R(0,t),
T_L ((partial psi_L(0,t)) / (partial x)) = T_R ((partial psi_R(0,t)) / (partial x))
)
$

定义
$
psi_r = R psi_i,
quad
psi_t = T psi_i.
$

设
$
psi_i = A_i e^(j omega t - k_1 x),\

psi_r = B_r e^(j omega t + k_1 x),\

psi_t = C_t e^(j omega t - k_2 x),\
$

则
$
A_i + B_r = C_t
$

$
Z_1 A_i - Z_1 B_r = Z_2 C_t
$

解得
$
B_r = (Z_1 - Z_2) / (Z_1 + Z_2) A_i
$

$
C_t = (2 Z_2) / (Z_1 + Z_2) A_i
$

$
R = (Z_1 - Z_2) / (Z_1 + Z_2),
quad
T = (2 Z_2) / (Z_1 + Z_2)
$

然而，功率并不与振幅成简单正比。

$
T_"power" = (Z_1 / Z_2) abs(T)^2 = (4 Z_1 Z_2) / (Z_1 + Z_2)^2 = 1 - R^2
$


== 8. 本章速记

1) 弦上波速：$c = sqrt(T / mu)$

2) 波数：$k = omega / v$

3) 驻波：$sin(k L) = 0$

4) 自由端阻抗 (特性)：$Z_0 = sqrt(T mu)$

5) 固定端输入阻抗：$Z_in = - j Z_0 cot(k L)$

6) 阻抗不连续：\
$quad$
$psi_r = R psi_i$，$psi_t = T psi_i$，\
$quad$
$R = (Z_1 - Z_2) / (Z_1 + Z_2)$，$T = (2 Z_2) / (Z_1 + Z_2)$

\
= Chapter 3: Propagation of sounds in fluids

== 1. 基本假设

$
cases(
p_"tot"(arrow(r),t) = p_0(arrow(r)) + p'(arrow(r),t),
rho_"tot"(arrow(r),t) = rho_0(arrow(r)) + rho'(arrow(r),t)
)
$

前一项为平均值或静水中的值，后一项为传播引起的扰动波。

== 2. 推导 fluid 中的波动方程

为进行推导，有三大等式和两个假设。

=== 1) 方程 1：Force balance

#figure(image("media/fa-fig-08.png", width: 70%))

$
dif F = a dif m 
$

$
dif F = &(p(x) - p(x + dif x)) S\

=& -S ((partial p) / (partial x)) dif x
$

$
dif m = rho_"tot" S dif x
$

$
a =& (D v_x) / (D t) \
=& (partial v_x) / (partial t)+  (partial v_x) / (partial x) (dif x) / (dif t)\
=& (partial v_x) / (partial t) + v_x (partial v_x) / (partial x)
$

注意，$a$ 是某个质点的加速度，因此使用了物质导数 $D / (D t)$。

为何在绳子中没有使用物质导数？因为绳子上的质点只能在垂直方向运动，而流体中的质点可以在 $x$ 方向上运动，因此需要考虑流体质点的对流效应。

联立得

#math.equation(
    $
    -(partial p) / (partial x) = rho_"tot" ( (partial v_x) / (partial t) + v_x (partial v_x) / (partial x) )
    $,
    block: true,
    numbering: _ => [(3.2)]
)

=== 2) 方程 2：mass balance

#figure(image("media/fa-fig-09.png", width: 70%))

对图上微元，近似认为其密度等于左边界处的密度。

从密度变化推导其质量变化率：

$
(dif (dif m)) / (dif t) =& dif / (dif t) (rho_"tot"(x,t) S dif x)\

=& (partial rho_"tot") / (partial t) S dif x
$

从流量推导质量变化率：

$
(dif (dif m)) / (dif t) =& S (rho_"tot" v_x)|_x - S (rho_"tot" v_x)|_(x+dif x)\

=& -S (partial (rho_"tot" v_x)) / (partial x) dif x
$

因此
$
-(partial (rho_"tot" v_x)) / (partial x) = (partial rho_"tot") / (partial t)
$

展开得

#math.equation(
    $
    -rho_"tot" (partial v_x) / (partial x) - v_x (partial rho_"tot") / (partial x) = (partial rho_"tot") / (partial t)
    $,
    block: true,
    numbering:  _ => [(3.2)]
)

=== 3) 方程 3：$p$ 和 $rho$ 的关系

绝热情况下：$p_"tot" = p_"tot"(rho_"tot")$。

在 $(rho_0, p_0)$ 处展开：

#math.equation(
    $
    dif p = c^2 dif rho
    $,
    block: true,
    numbering: _ => [(3.3)]
)

=== 4) 假设 1：扰动很小

#math.equation($
    cases(
    abs(p'(x,t)) << p_0(x),
    abs(rho'(x,t)) << rho_0(x)
    )$,
    block: true,
    numbering: _ => [(3.4)]
)




=== 5) 假设 2：速度扰动很小

#math.equation(
    $
    v_x approx 0
    $,
    block: true,
    numbering: _ => [(3.5)]
)


=== 6) 联立

将 (3.4) 和 (3.5) 应用到 (3.1) 和 (3.2)，消去高阶小量，得
#math.equation(
    $
    cases(
        -(partial p) / (partial x) = rho_0 (partial v_x) / (partial t),
        -rho_0 (partial v_x) / (partial x) = 1 / (c^2) (partial p) / (partial t)
    )
    $,
    block: true,
    numbering: _ => [(3.6)]
)


对第一式两边对 $x$ 求导：
$
(partial^2 p) / (partial x^2) = -rho_0 (partial^2 v_x) / (partial t partial x)
$

对第二式两边对 $t$ 求导：
$
-rho_0 (partial^2 v_x) / (partial t partial x) = 1 / (c^2) (partial^2 p) / (partial t^2)
$

因此
$
(partial^2 p) / (partial x^2) = 1 / (c^2) (partial^2 p) / (partial t^2)
$

== 3. 3D waves in fluid

$
nabla^2 p = (partial^2 p) / (partial x^2) + (partial^2 p) / (partial y^2) + (partial^2 p) / (partial z^2)
$

$
nabla^2 p = 1 / (c^2) (partial^2 p) / (partial t^2)
$

== 4. Plane waves

$
tilde(p)(x,t) = tilde(A) e^(j(omega t - k x)) + tilde(B) e^(j(omega t + k x))
$

== 5. 流体特性阻抗

$
Z_0 = rho_0 c
$

== 6. 声速

$
c = sqrt(((partial p) / (partial rho))_"ad")
$

或者引入
$
beta_"ad" := lr(1 / rho_0 ((partial rho) / (partial p))_"ad" |)_(p=p_0)
$


$
K_"ad" = 1 / beta_"ad"
$

$
c = sqrt(K_"ad" / rho_0)
$

== 7. 球面波

$
p(r,t) = 1 / r f(r - c t)
$

== 8. 本章速记

1) 流体波动方程关系式 ：$(partial^2 p) / (partial x^2) = 1 / (c^2) (partial^2 p) / (partial t^2)$

2) 流体阻抗：$Z_0 = rho_0 c$

3) 波传播速度：$c = sqrt(K_"ad" / rho_0)=sqrt(((partial p) / (partial rho))_"ad")$

4) 球面波：$p(r,t) = 1 / r f(r - c t)$


