// -----------------
// Cover
// -----------------
#set page(
  margin: (top: 22mm, bottom: 22mm, left: 18mm, right: 18mm),
  columns: 1,
  background: none,
  numbering: none,
)

#place(center, dy: 80mm)[
  #set text(size: 22pt, weight: "bold")
  #align(center)[Fundamentals of Acoustics Notes]
]

#place(bottom + center, dy: -10mm)[
  #set text(size: 12pt, weight: "regular")
  #align(center)[基于米兰理工大学（Politecnico di Milano）\ 2025 Fall《Fundamentals of Acoustics》课程]

  #v(0.8em)
  #set text(size: 11pt)
  #align(center)[作者：#link("https://github.com/worldedge1933/fundamentals-of-acoustics-notes")[\@worldedge1933]]

  #v(0.6em)
  #align(center)[2026-01-03]
]


#pagebreak()

// -----------------
// Table of contents
// -----------------
#set page(
  margin: (top: 22mm, bottom: 22mm, left: 18mm, right: 18mm),
  columns: 1,
  background: none,
  numbering: none,
)

#set text(size: 18pt, weight: "bold")
#align(center)[目录]

#v(1.2em)
#set text(size: 11pt, weight: "regular")
#show outline.entry.where(level: 1): set block(above: 2em, below: 1.2em)
#outline(depth: 2)

#pagebreak()

// -----------------
// Main document
// -----------------
#set page(
  margin: (top: 18mm, bottom: 18mm, left: 10mm, right: 10mm),
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
#counter(page).update(1)
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
  Delta omega = omega_1 - omega_2 = beta / m = -2A
$

$
  Q = omega_0 / (Delta omega) =omega_0 / (-2 A) = (m omega_0) / beta
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

#figure(
  image("media/fa-fig-01.png", width: 100%),
)

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
#figure(
  image("media/fa-fig-02.png", width: 100%),
)
$
  f_1(v t) + f_2(-v t) = 0
  quad => quad
  f_1(v t) = - f_2(-v t)
$

=== 2) 自由端：$((partial y) / (partial x))|_(x=0) = 0$
#figure(
  image("media/fa-fig-03.png", width: 100%),
)
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

#figure(
  image("media/fa-fig-04.png", width: 100%),
)

假设波动方程：
$
  y = & A sin(omega t - k x) + B cos(omega t - k x) \
      & + C sin(omega t + k x) + D cos(omega t + k x)
$

$
  y(0,t) = 0 quad => quad A = -C, B = -D
$

因此
$
  y = & A [sin(omega t - k x) - sin(omega t + k x)] \
      & + B [cos(omega t - k x) - cos(omega t + k x)] \
    = & 2 [A cos(omega t) - 2 B sin(omega t)] sin(k x)
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
  f(t) = & -T sin (theta) \
       = & -T lr(( ( (partial y) / (partial x)) mid(|)_(x=0))) \
       = & -j T k tilde(A) e^(j (omega t - k x))
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
  Z_"in" = f(t) / v(0,t) = (Z_0 (tilde(A) - tilde(B))) / (tilde(A) + tilde(B))
$

代入 $tilde(B) = - tilde(A) e^(-j 2 k L)$：
$
  Z_"in" = & Z_0 (1 + e^(-j 2 k L)) / (1 - e^(-j 2 k L)) \
         = & Z_0 (e^(j k L) + e^(-j k L)) / (e^(j k L) - e^(-j k L))
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

== 8. 拍频

尽管我们从数学上知道，包络线的频率是两个简谐波频率之差的一半，但物理上我们更关心的是实际听到的拍频。

而包络线的正负起到的作用是一样的，这就导致了听到的拍频是两个简谐波频率之差，而非一半。

== 9. 本章速记

1) 弦上波速：$c = sqrt(T / mu)$

2) 波数：$k = omega / v$

3) 驻波：$sin(k L) = 0$

4) 自由端阻抗 (特性)：$Z_0 = sqrt(T mu)$

5) 固定端输入阻抗：$Z_"in" = - j Z_0 cot(k L)$

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
  dif F = & (p(x) - p(x + dif x)) S \
        = & -S ((partial p) / (partial x)) dif x
$

$
  dif m = rho_"tot" S dif x
$

$
  a = & (D v_x) / (D t) \
    = & (partial v_x) / (partial t)+ (partial v_x) / (partial x) (dif x) / (dif t) \
    = & (partial v_x) / (partial t) + v_x (partial v_x) / (partial x)
$

注意，$a$ 是某个质点的加速度，因此使用了物质导数 $D / (D t)$。

为何在绳子中没有使用物质导数？因为绳子上的质点只能在垂直方向运动，而流体中的质点可以在 $x$ 方向上运动，因此需要考虑流体质点的对流效应。

联立得

#math.equation(
  $
    -(partial p) / (partial x) = rho_"tot" ( (partial v_x) / (partial t) + v_x (partial v_x) / (partial x) )
  $,
  block: true,
  numbering: _ => [(3.2)],
)

=== 2) 方程 2：mass balance

#figure(image("media/fa-fig-09.png", width: 70%))

对图上微元，近似认为其密度等于左边界处的密度。

从密度变化推导其质量变化率：

$
  (dif (dif m)) / (dif t) = & dif / (dif t) (rho_"tot"(x,t) S dif x) \
                          = & (partial rho_"tot") / (partial t) S dif x
$

从流量推导质量变化率：

$
  (dif (dif m)) / (dif t) = & S (rho_"tot" v_x)|_x - S (rho_"tot" v_x)|_(x+dif x) \
                          = & -S (partial (rho_"tot" v_x)) / (partial x) dif x
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
  numbering: _ => [(3.2)],
)

=== 3) 方程 3：$p$ 和 $rho$ 的关系

绝热情况下：$p_"tot" = p_"tot"(rho_"tot")$。

在 $(rho_0, p_0)$ 处展开：

#math.equation(
  $
    dif p = c^2 dif rho
  $,
  block: true,
  numbering: _ => [(3.3)],
)

=== 4) 假设 1：扰动很小

#math.equation(
  $cases(
    abs(p'(x,t)) << p_0(x),
    abs(rho'(x,t)) << rho_0(x)
  )$,
  block: true,
  numbering: _ => [(3.4)],
)




=== 5) 假设 2：速度扰动很小

#math.equation(
  $
    v_x approx 0
  $,
  block: true,
  numbering: _ => [(3.5)],
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
  numbering: _ => [(3.6)],
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
  c = sqrt(K_"ad" / rho_0) = sqrt((gamma p_0) / rho_0)
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



\
= Chapter 4: Energy, intensity, pressure level, and attenuation of sounds

== 1. Power in damped forced oscillator

$
  cases(
    f(t) = hat(f) cos(Omega t),
    v(t) = hat(v) cos(Omega t + Phi)
  )
$

$
  P = & f dot v \
    = & hat(f) hat(v) cos(Omega t) cos(Omega t + Phi) \
    = & (hat(f) hat(v)) / 4 (e^(j Omega t) + e^(-j Omega t)) (e^(j(Omega t + Phi)) + e^(-j(Omega t + Phi))) \
    = & (hat(f) hat(v)) / 4 (e^(j(2 Omega t + Phi)) + e^(-j Phi) + e^(j Phi) + e^(-j(2 Omega t + Phi))) \
    = & 1 / 2 hat(f) hat(v) (cos(Phi) + cos(2 Omega t + Phi))
$

active power：$cos(Phi)$

reactive power：$cos(2 Omega t + Phi)$

Reactive power 平均值恒是 0，代表了系统中不同形式能量的交换，active power 才是系统耗能。

$
  P_"act" = 1 / 2 hat(v)^2 Re(Z) = 1 / 2 Re(f v^*) = 1 / 2 Re(f^* v)
$

== 2. 弦

我们已知，弦的振动可以分成多个模态叠加。

$
  y = sum_n C_n sin(omega_n t + phi_n) sin(k_n x)
$

$
  v = sum_n C_n omega_n cos(omega_n t + phi_n) sin(k_n x)
$

每个模态都可以看作一个独立的能量振子，在该模态中，弦的动能和势能交替达到最大值，总能量保持不变。

因此要求弦总能量，可以计算每个模态的最大动能或最大势能，然后相加。

总能量可表征为

$
  dif E_n^"max" = 1 / 2 mu v_"max,n"^2(x) dif x = 1 / 2 mu omega_n^2 C_n^2 sin^2(k_n x) dif x
$

$
  E_"tot" = sum_n E_n^"max" = 1 / 2 integral_0^L dif E_n^"max" = 1 / 4 sum_n omega_n^2 mu L C_n^2
$

#colbreak()

== 3. 流体中声波的能量

定义 sound intensity 或 energy flux density

$
  arrow(I) = p arrow(v)
$

于是有 Time-averaged intensity（也即 active power）

$
  overline(arrow(I)) = overline(p arrow(v)) = 1 / 2 Re(p arrow(v)^*)
$

同时定义 energy density

$
  overline(w) = rho_0 / 2 overline(v^2) + (overline(p^2)) / (2 rho_0 c^2) = overline(w)_"kin" + overline(w)_"pot"
$

== 4. 平面波的Intensity


$
  p(x,t) = & p^+(x,t) + p^-(x,t) \
         = & A e^(j(omega t - k x + phi_A)) + B e^(j(omega t + k x + phi_B))
$

$
  v_x(x,t) = & (p^+(x,t)) / (rho_0 c) - (p^-(x,t)) / (rho_0 c) \
           = & (p^+(x,t)) / Z_0 - (p^-(x,t)) / Z_0 \
           = & (p^+(x,t)) / Z^+ + (p^-(x,t)) / Z^-
$

$
  cases(
    Z^+ := +Z_0 = rho_0 c,
    Z^- := -Z_0 = -rho_0 c
  )
$

Instantaneous intensity：

$
  I(x,t) = p(x,t) v_x(x,t) = (p^+(x,t)^2) / (rho_0 c) - (p^-(x,t)^2) / (rho_0 c)
$

Time-averaged intensity：

$
  overline(I) = ((tilde(p)^+)^2) / (rho_0 c) - ((tilde(p)^-)^2) / (rho_0 c)
$

$tilde(zws)$ 表示均方根

== 4. Progressive 平面波的 Intensity

Progressive wave 中，仅有一个方向的平面波：

$
  p(x,t) = A cos(omega t - k x + phi_A)
$

$
  v_x(x,t) = p(x,t) / (rho_0 c)
$

这种情况下

$
  w_"kin"(x,t) = w_"pot"(x,t) = & 1 / 2 w(x,t) \
                              = & (A^2) / (2 rho_0 c^2) cos^2(omega t - k x + phi_A)
$

$
  w = p^2 / (rho_0 c^2)
$

$
  overline(w) = (overline(p^2)) / (rho_0 c^2) = (A^2) / (2 rho_0 c^2)
$

$
  I(x,t) = (A^2) / (rho_0 c) cos^2(omega t - k x + phi_A) = c w(x,t)
$

$
  overline(I) = 1 / 2 (A^2) / (rho_0 c) = 1/2 (Delta p_"max"^2)/ Z_c = c overline(w)
$

== 5. standing 平面波的Intensity

$
  p = & A cos(omega t - k x + phi_A) + A cos(omega t + k x + phi_B) \
    = & 2 A cos(omega t + phi_1) cos(k x + phi_2)
$

$
  overline(w) = ( A^2) / (rho_0 c^2)
$

$
  overline(I) != c overline(w)
$

$
  overline(I) = 0
$

== 6. 球面波的Intensity

$
  p(r,t) = A / r cos(omega t - k r + phi_A)
$

$
  w(r, t) = (p^2 (r, t)) / (rho_0 c^2) = (A^2) / (rho_0 c^2 r^2) cos^2(omega t - k r + phi_A)
$

$
  I = c w
$

$
  overline(I) = 1 / 2 (A^2) / (rho_0 c r^2) prop 1 / r^2
$

== 7. sound pressure level

$
  p_0 = 2 times 10^(-5) space upright(P a)
$

$
  L = 20 log_10((tilde(p)) / (p_0)) space upright(d B)
$

已知：$I prop p^2$

$
  L = 10 log_10((I) / (I_0)) space upright(d B)
$

== 8. Acoustic impedance

#figure(image("media/fa-fig-9.1.png", width: 30%))

Average power of a sinusoidal wave in gas:

$
  P = 1/2 (Delta p_"max"^2) / Z_c S = 1/2 (Delta p_"max"^2) / (Z_c/S)
$

于是有：

$
  Z_A = Z_c/S
$

== 9. Reflection and transmission coefficients in liquids

#figure(image("media/fa-fig-07.png", width: 40%))

我们已知，对于绳上的波，传播时遇到阻抗不连续处，有:

$
  cases(
    R = (Z_1 - Z_2) / (Z_1 + Z_2),
    T = (2 Z_2) / (Z_1 + Z_2)
  )
$

然而，对于流体中的波，则截然不同

#figure(image("media/fa-fig-9.2.png", width: 30%))

需要将 $Z_1$ 和 $Z_2$ 替换为 $S_1/Z_1$ 和 $S_2/Z_2$

因此得到：

$
  cases(
    R = display((S_1 / Z_1 - S_2 / Z_2 ) / ( S_1 / Z_1 + S_2 / Z_2 )),
    T = display((2 S_1 / Z_1) / ( S_1 / Z_1 + S_2 / Z_2 )),
  )
$

会发现，即使面积一样，表现仍不一样

#figure(image("media/fa-fig-9.3.png", width: 80%))

= Chapter 5: Sound sources and sound radiation

== 1. Spherical waves

对于一般的球面波，我们有

$
  p(r,t) = 1 / r f(r - c t)
$

对于简谐形式的波

$
  p(r,t) = A / r cos(omega t - k r)
$

$
  I(r,t) = (p(r,t)^2) / (rho_0 c) = w(r,t) c
$

对于球面波，我们知道 $v_r = (p(r,t)) / (rho_0 c)$。但是对于球面波来说

$
  v_r = (p(r,t)) / (rho_0 c) (1 + 1 / (j k r))
$

$
  cases(
    k r << 1 => v_r tilde.equiv (p(r,t)) / (rho_0 c) 1 / (j k r) quad "近场",
    k r >> 1 => v_r tilde.equiv (p(r,t)) / (rho_0 c) quad "远场，和均匀平面波一样"
  )
$

== 2. 从简谐球面波到声源参数的推导

假设，我们从一个简谐球面波声源开始，它位于原点，向各个方向均匀发散。

先定义 $Q$：volume velocity $[m^3 / s]$。

$
  dif V = 4 pi r^2 dif r = Q dif t
$

$
  Q = & 4 pi r^2 (dif r) / (dif t) \
    = & 4 pi r^2 v_r
$

$
  lim_(r -> 0) Q = 4 pi r^2 (p(r,t)) / (rho_0 c) 1 / (j k r) = (4 pi A)/(rho_0 j omega) e^(j omega t) = hat(Q) e^(j omega t)
$

因此

$
  lim_(r->0) Q = hat(Q) e^(j omega t) => A = rho_0 j omega hat(Q) / (4 pi)
$

于是

$
  p(r,t) = (rho_0 j omega hat(Q)) / (4 pi r) e^(j(omega t - k r))
$

$
  overline(I) = 1 / 2 (A^2) / (rho_0 c r^2) = (omega^2 rho_0 hat(Q)^2) / (32 pi^2 c r^2)
$

== 3. Directional factor

#figure(image("media/fa-fig-10.png", width: 70%))

当考虑点声源阵列（如线阵列），发现在场的叠加成

$
  p(r,theta,phi,t) = (A) / (r) R(theta,phi) e^(j(omega t - k r))
$

$theta, phi$ 和 $r, t$ 可以完全分开

$R(theta,phi)$ 是 directional factor

== 3. Dipole

#figure(image("media/fa-fig-11.png", width: 55%))

$
  Q_1(t) = +hat(Q) e^(j omega t)
$

$
  Q_2(t) = -hat(Q) e^(j omega t)
$

$
  p(r,t) = (j omega rho_0 hat(Q)) / (4 pi) (e^(-j k r_1) / r_1 - e^(-j k r_2) / r_2) e^(j omega t)
$

$
  r_1 -> r + d / 2 cos(theta), quad r_2 -> r - d / 2 cos(theta)
$

$
  p(r,t) =& (j omega rho_0 hat(Q)) / (4 pi r) (e^(j k d / 2 cos(theta)) - e^(-j k d / 2 cos(theta))) e^(j omega t - j k r)\
  =& -(omega rho_0 hat(Q)) / (2 pi r) sin(k d / 2 cos(theta)) e^(j(omega t - k r))
$

当 $k d << 1$ 时

$
  p(r,t) = -(omega^2 rho_0 hat(Q) d) / (4 pi r c) cos(theta) e^(j(omega t - k r))
$

$
  R(theta) = cos(theta)
$

== 4. The linear array

#figure(image("media/fa-fig-12.png", width: 30%))

$
  p(r,alpha,t) =& (j omega rho_0 hat(Q)) / (4 pi r) sum_(n=0)^(N-1) e^(j[omega t - k (r - n d cos alpha)])\
  =& (j omega rho_0 hat(Q)) / (4 pi r) sum_(n=0)^(N-1) e^(j k d n sin alpha) e^(j(omega t - k r))\
  =& (j omega rho_0 N hat(Q)) / (4 pi r) (e^(j N k d sin alpha) - 1) / (N (e^(j k d sin alpha) - 1)) e^(j(omega t - k r))
$

$
  abs(R(alpha)) = abs((sin(N k d/2 sin alpha)) / (N sin(k d/2 sin alpha)))
$

注意这里是取模

为了更方便记忆，注意到，我们在 Chapter 5.3 中使用了 $1/2 d sin theta$，我们记其为 $Delta r$，于是有


$
  abs(R(alpha)) = abs((sin(N k Delta r)) / (N sin(k Delta r)))
$

== 5. 多普勒效应

#figure(image("media/fa-fig-13.png", width: 50%))

1) 移动声源 (source)

$
  lambda' = (c - v_s) T
$

$
  c T' = lambda'
$

$
  c 1/f' = (c - v_s) 1/f
$

$
  f' = f / (1 - v_s / c)
$

2) 移动接收器

$
  T' = lambda / (c + v_r) = (1 / f c) / (c + v_r)
$

$
  f' = (1 + v_r / c) f
$


\
= Chapter 7: Pipes

== 1. Infinite transmission lines

#figure(
  image("media/fa-fig-14.png", width: 100%),
)

流动方程(7.1)：

$
  cases(
    p(x) = A e^(-j k x) + B e^(j k x),
    Z_0 v(x) = A e^(-j k x) - B e^(j k x)
  )
$


边界条件

$
  cases(
    p(0) = A + B,
    Z_0 v(0) = A - B
  )
$

以上谈论的是通式，如果要谈论无限长管线的输入阻抗，则需要认为没有反射波，那么

$
  B = 0
$

$
  Z_"in" = Z_0 = rho c
$

== 2. Finite transmission lines

#figure(
  image("media/fa-fig-15.png", width: 100%),
)

展开 (7.1) 式，有

$
  p(x) = & A e^(-j k x) + B e^(j k x) \
       = & (A + B) cos(k x) - j (A - B) sin(k x)
$

$
  Z_0 v(x) = & A e^(-j k x) - B e^(j k x) \
           = & (A - B) cos(k x) - j (A + B) sin(k x)
$

相较于无限，边界条件多了

$
  (p(l)) / (v(l)) = Z_L
$

$
  Z_0 (A e^(-j k l) + B e^(j k l)) / (A e^(-j k l) - B e^(j k l)) = Z_L
$

$
  A e^(-j k l) + B e^(j k l) = Z_L / Z_0 (A e^(-j k l) - B e^(j k l))
$

$
  A (1 - Z_L / Z_0) = -B (1 + Z_L / Z_0) e^( 2 j k l)
$

$
  A (Z_0 - Z_L) / Z_0 = -B (Z_0 + Z_L) / Z_0 e^( 2 j k l)
$

$
  A = B (Z_L + Z_0) / (Z_L - Z_0) e^(j 2 k l)
$

于是

$
  Z_"in" & = (p(0)) / (v(0)) = Z_0 (A + B) / (A - B) \
         & = Z_0 ((Z_L + Z_0) / (Z_L - Z_0) e^(j 2 k l) + 1) / ((Z_L + Z_0) / (Z_L - Z_0) e^(j 2 k l) - 1) \
         & = Z_0 ((Z_L + Z_0) e^(j 2 k l) + (Z_L - Z_0)) / ((Z_L + Z_0) e^(j 2 k l) - (Z_L - Z_0)) \
         & = Z_0 ((Z_L + Z_0) e^(j k l) + (Z_L - Z_0) e^(-j k l)) / ((Z_L + Z_0) e^(j k l) - (Z_L - Z_0) e^(-j k l)) \
         & = Z_0 (Z_L cos(k l) + j Z_0 sin(k l)) / (Z_0 cos(k l) + j Z_L sin(k l)) \
         & = Z_0 (Z_L + j Z_0 tan(k l)) / (Z_0 + j Z_L tan(k l))
$

若 $k l = pi / 2 + m pi$，

$
  Z_"in" = (Z_0^2) / (Z_L) prop 1 / Z_L
$

quarter-wavelength behavior

若 $Z_L -> oo$，

$
  Z_"in" = -j Z_0 cot(k l)
$

rigid end plate

和固定端弦一样

== 3. Pipes with discontinuities

#figure(
  image("media/fa-fig-16.png", width: 100%),
)

在 discontinuity 处，管中声波传播满足两边压力相等，边界处流速连续。

$
  cases(
    p_1 = p_2,
    v_1 S_1 = v_2 S_2
  )
$

于是

$
  (p_1) / (v_1) = (p_2) / (v_2) (S_1 / S_2) = Z_2 (S_1 / S_2) = Z_1
$

即
$
  Z_1/Z_2 = S_1 / S_2
$

这里的 1,2 指的是间断点的左趋近和右趋近。

== 4. Resonances

#figure(
  image("media/fa-fig-17.png", width: 100%),
)

$
  Z_"in,1"^+ = -j Z_0 cot(k l')
$

当 $k l' << 1$ 时，$Z_"in,1"^+ = -j Z_0 cot(k l') tilde.equiv (Z_0) / (j k l') = (rho c^2) / (j omega l')$

$
  Z_"in,1"^- & = Z_"in,1"^+ (S_2 / S_1) \
             & = (rho c^2) / (j omega l') (S_2 / S_1)
$

$
  Z_"in,2"^+ = Z_0 (Z_"in,1"^- + j Z_0 tan(k l)) / (Z_0 + j Z_"in,1"^- tan(k l))
$

当 $k l << 1$，$Z_"in,2"^+ tilde.equiv (Z_"in,1"^- + j Z_0 k l) / (Z_0 + j Z_"in,1"^- k l)$

$
  Z_"in,2"^- = Z_"in,2"^+ (S_1 / S_2) = j rho c S_1/S_2 ((omega l )/c S_1 - c / (omega l^') S_2)/(S_1 + l/l^' S_2)
$

这种共振器又称海姆霍兹共振器。

注意到，这个共振器的输入阻抗为纯虚，因此共振发生在 0 处（此时由于实际由损耗，有一个不为 0 的实阻抗）

$
  omega_"res" = sqrt((c^2 S_1) / (l' V S_2))
$

实际上，最外层的 $S_1$对共振频率毫无影响。

== 5. 声管共振

=== (1) 管两端开口

两侧都是压强波节点，$p=0$

因此管内驻波要满足

$
  L = n lambda / 2, quad n = 1,2,3,...
$

全谐波

=== (2) 一端开口一端封闭

封闭端为压强波腹，开口端为压强波节点

驻波模式满足

$
  L = (2 n - 1) lambda / 4, quad n = 1,2,3,...
$

仅奇次谐波
