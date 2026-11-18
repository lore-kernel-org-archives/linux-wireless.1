Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795033274;
	b=qC4qTacX1yFC0Il3yoXtfIps/fq5OD4J6qQkpvQLIzOl4iowCA65CophXdZYrPISnlKZ
	 RNnPZQo8vzM7yyjkrUO9i4YZfcrfvup0AO8q0UF/UrpWBTmiEOZQMybmxGbX+88+DyHer
	 s1clEJzkYIMjZCtYSH5FA4dd6l7qXM3D1IE/JI6HzECI9C/ezaJCUHMdpLebjRod7G/UV
	 OWSOOHzEOfkynVGgb8VXrWoSszp8qwCkqlv2EI2Keqyy+koT4N/Xg40GdU9qBDFlVF1Oa
	 f6KloC0p6+BMA3Lag7X2y0ASH4TYaZ2yMnD5bqx47EQdi4xr8EjfCPD4c9/n5Kkprng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PhqPn/ICV8v/KU7lWAnokH2D84rMdKB99wdgjfIsDhg=;
	b=NHHrIBHuP7xrS526WqsUxz1OY8F2pQ5VR9e6L6n6i99dN60Mk4cxBELh3FofM2K6wgin
	 1X7oCDQGMwctJlffTjfzHJbDhn2m6IlAJFZN0AQ86o7xU3NEKh4p4V5WcZNbIJHsrDdpp
	 AVRKXrFSKfWMUfe8UU1LNvhL1EIH5ScucQ57m78sD3VGweEMZUAbuQuRdCAI2KqxOUksh
	 yYulfTRLGoAPsR8MeOXrne+mojqqg/U2LCY7Ec/kfk889ijiPNqgBC7r7xsl6kAUOLeIR
	 MtCLJBIs58hwqmcM1D1A4Wr3Pd5MHoZKEfezwA4yOrRQV6MP7SxRJgQwb33pwpLoaWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dpAEJXdc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KCJfUviT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE7D606A32C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 20:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCE7D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dpAEJXdc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KCJfUviT
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIJtaBJ131594
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 20:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhqPn/ICV8v/KU7lWAnokH2D84rMdKB99wdgjfIsDhg=; b=dpAEJXdcPnatspnA
	S07G/YQ2IRII6ORHQHfRa4t6sTEhkDMP8EzaOYLCCYd8MPoJ7T0kqoWsDfrOtmk7
	6HRVGsbhPx4SZZdnzsxpyOtL5cuXMSV+umJcz0xfn8WFdZfa0jLgci+cgiVjv1dX
	uNPiWEqeZgZuZROeXXlT5I5SmOHz03O4hwfL83+9CzAJ4HQyZotN7hm4OpZez4Cm
	41gcZBYfOp3+UKmBo54LFxe951vllosKAzrmMLMrDNPOcm1M5fqAhLCYknC7k9bx
	C7N2U+d/g43036aqxGdaJYnQ9bjtXCRAngwotBRdDQ3P2cTxjx5zR1NZY92q6SZb
	H/MGDQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fgg12qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 20:21:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495a1f5e47so247347385a.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 12:21:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795033272; cv=none;
        d=google.com; s=arc-20260327;
        b=WkxN7mCOec2cAE+HpxP3MvAAhS/B2XBJYe057mo4rxqQV2wDenu2tFCQV6VX3/4ecM
         d3Kd3/dM3lz+BihXtj86xnCTU6zXGu5Pg3F+OE9V2I0fUeyPCD1JtgWkrV6p0AjRK9+R
         n39dJhLncCp/2PLN0aMLV9VZRHsbkmEo9lxLD4x/wKbh59tMAios2RzDoVZ4FZnu1S1S
         ArpP76tAlmvZo4uHatMfOyIHjDP96HK9/LaAILGVJl3sNHXcdVO1rCEKOF7hOpG0v5Ar
         SLDYmBQ+lVC+aKoGSFljMke4jQHDXrag8onNVpXZNUO0fiwQYciQfXnxO4SQxZ9Am9u5
         KUWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PhqPn/ICV8v/KU7lWAnokH2D84rMdKB99wdgjfIsDhg=;
        fh=/OIZs7uH5JpldXsr2mQ2kWp3ZIoB5C8X7hsqrBSB8PU=;
        b=V2pOPUwOmf+A7DACWXV+Uqr3UcZ79IKL9UgzQJ14e3SMCA1rpRHvMS3bJ8V0W2jz2v
         XVRgy5pG3dtuLv226GpzO56ZlwUQEJxJW0O5quJtXJjBsnZGdCOqTCus+SPsI6ePFaNv
         xvG9ggEeg8TKAwLnckcLNziJzOdgIkdnpxeLGP+qxDCuWB7z7UlOu/JrMq82R6l5mtI+
         IQ27+n9QwLsLcKRrkxlFXS+RACGZo0GZ1zXvd7maX4NZT49dZeKgzzxPbu8jNFSR/cEu
         V7NObftYkX5jLDy+VtHzKkSQ0DY680Nln4CqqSjRVXq6dyd97gD64Cj9CzQpzTXtj1HM
         nbrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795033272; x=1795638072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PhqPn/ICV8v/KU7lWAnokH2D84rMdKB99wdgjfIsDhg=;
        b=KCJfUviTRuV0Z7GTWfJz8XO/IdaEFc/kZo7ZFTnhZ/1KdZO7yn8/wBSX339eyWgWSF
         glGlX4CU8lIRL3Hl4kB0HtpSekhmcoHmfiNhCcjenifEds5OwxfvsRSkMlsI0g/7V8nE
         zAQoeSGVX7/oHMJ/l54qXNkkywvWnc7J+j+HHPJOSSOL2lkHcM4UJgTyLh9i5CkPQ4SM
         ZoE9frnyTeBUxy7ppoE0InR7S4C6d372/gp+S6lb9rpeQM31tOlutCjHpd6MI1+okeA/
         YibCvUyoAYFB4JgIg8udrHt0VGmja1RQw4L7EUnWfFsX2dp1w0K6jk+3NCh6ycMYnor9
         8VWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795033272; x=1795638072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PhqPn/ICV8v/KU7lWAnokH2D84rMdKB99wdgjfIsDhg=;
        b=nVi/i9KRHY3bw7qQ77HhuvrhFFP0GBFg4gNFGFpF/QhXrnXxpzrflqCjUnKejKV0oV
         /GH7D6Lu2cHsFHIDSGwd9EPOm7xvWZ+jyFf6oUdu6aIwu90VoMfLq4BMui9bgBb9Dyef
         TtG88EJUcCQKe1ljYFxWi/ss2ERu6nvdzktElKOK0vIlSXJIRT+sypDtZk7CnqaeQoRW
         qcXcVVrfbXVfaXftJ9sbApL29ErVVGGdELTL53zeEQ8X1gbTSnb7gAGcHYrKt7WRt0Ix
         Negl16aEXYhs26ruwPJqOxCLLr03bGAbgjV1eyZ7UynaF8sdE/AsgczyQ2Re/PAhr8dt
         U/Ng==
X-Forwarded-Encrypted: i=1; AL+hErFEvhXu0ZvfoKeet9J3FdeI4RXOUtno23WazOiDXVTba5kl9OUs99XALy8KUu6dQuqMyfMzwRTmMYVPVxug9A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8BvgZi9gXwJVcq8ukWykGcWOwFpDYb1hLaAJTNcP6vfECwBxrU
	6z1z8Uh4CxpN58zWFG+bKqmZLTSLqVMh8lpMJdyky22hlZNe8ZZ0aUDd2Ns81X5zBDgXdjPwNEg
	t4JAAmSjxM5zVdJzuLcsF+skLini2BVig+wTtuiRJjXc6nL81WXTkBMxDydJCdModn5UKeuZKil
	YPBWz16+Bq/Gf+2beQXu6a92CxQpszNue/XR+LVHRl3pwV
X-Gm-Gg: AYBFou1MLLHKJRwP4LFdb2zSp7wGTos0LyFChr1DQEbjCfY8zj+ZpH8G43yTTwRz9NQ
	eq7zpvKxG365yeXUSm/ODieKF1l4n40LNFrzhPwXaEYm+HmQJUNzaRKQDbdQKZjF8TnhXV/h1+o
	md0f35AKQilrw5JAhYJx23XZcTP5ow4K2OGKlpQKnpkw5AnQpyzCHZj7fs621HtREwpMQqJs6Cw
	iOSQmdHodMAz75J9S4wIOGzHpCa7jxYWFMeZEFg4CowuwKCOWaQBB6OJEQ+GBTGK9thda6nw04=
X-Received: by 2002:a05:620a:2b92:b0:93f:3e45:a419 with SMTP id af79cd13be357-949995b362fmr665350785a.38.1795033271741;
        Wed, 18 Nov 2026 12:21:11 -0800 (PST)
X-Received: by 2002:a05:620a:2b92:b0:93f:3e45:a419 with SMTP id
 af79cd13be357-949995b362fmr665343785a.38.1795033270937; Wed, 18 Nov 2026
 12:21:10 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com> <20261118-wcnss-series-v1-v1-2-a64d82e151bf@atlr-engineering.com>
In-Reply-To: <20261118-wcnss-series-v1-v1-2-a64d82e151bf@atlr-engineering.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 21:20:59 +0100
X-Gm-Features: AclHuK-LczRUNo-ZjKC-18fa_PbQ7l34X57L0f_tADLZJQVkzCFWJzXtV3xPheA
Message-ID: <CAFEp6-0sYs0mEm+4E_zEgXcSjoYKwtW_YJSa601gb=717Gec4A@mail.gmail.com>
Subject: Re: [PATCH 2/3] wifi: wcn36xx: Do not enforce interrupt trigger type
To: arapaille@atlr-engineering.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>,
        Eugene Krasnikov <k.eugene.e@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: YpISVgMewi9PYhTy5eNRRHguw00Fp5JZ
X-Proofpoint-ORIG-GUID: YpISVgMewi9PYhTy5eNRRHguw00Fp5JZ
X-Authority-Analysis: v=2.4 cv=fOSsTpae c=1 sm=1 tr=0 ts=6afe08b8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=Knk3v0qlAAAA:8
 a=cZ8Ya61OWEQOVQFXRIkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=L2g3GqtBoyQv0ocsUjqh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX2VvbSfsj3Icj
 wAjdz9moAmYeNNby/IBhRHX392n1ko4GupULBtkB016wkjAvq960C0oPDDH2wwklYd90gB1qMRP
 ifMgzGxvcHJ/2A0VQfrlWYbUGnIQJfg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX76FwLns+P0Q0
 plbnjBGVSVXJzx4WPhucp4sXHGMs6m44MsOHBTdtEVbroDNXSL9zp03iSgHDjK3BBbLd6vlIDQ9
 bM+aYNaC4jDUL+MDiPuEtlqKK6nB7o7yCpAiJ8WV8wqNturh0DcLmrOLuLolN7UEBW2zVo/FSfZ
 gpsONkl2UifiygaiLeMmVqceAvf456PlziiiEM0uFaUr+T8T2I+3YqpPpQEJ+52wC9BeVVPF3P4
 SIriQulFzNtHBzofmosdSASfkC05TVy/Wsg3lL4K1sbh9SP4MNV2OD7lwN9GnBpsL18HUul1/0N
 dk5GoR3F/sI/j4bAhIFwSM1A6DQasxVMYYbLQ0wueheUeYyEoBioH2HLvoili80LbIJgt7q15MO
 Rrlif0U3Vny2bQ0wXoWCGtdDkYBZrfG8/gdqNui7UDfRFFA7t9aB49ufp8S9DRTot14v0W+d0UN
 jv6yPbRMgiP0P7A/Oyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180077

On Wed, Nov 18, 2026 at 3:58=E2=80=AFPM Alexandre Rapaille via B4 Relay
<devnull+arapaille.atlr-engineering.com@kernel.org> wrote:
>
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
>
> Forcing IRQF_TRIGGER_HIGH over the DT type makes the re-probe after a WCN=
SS
> restart fail ("type mismatch, failed to map hwirq"). Rely on the DT, as
> commit 1ee6c5abebd3 ("ath10k: do not enforce interrupt trigger type") did=
.

Can you explain why it fails? Is the fix at the right layer here?

>
> Fixes: 8e84c2582169 ("wcn36xx: mac80211 driver for Qualcomm WCN3660/WCN36=
80 hardware")
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>
> ---
>  drivers/net/wireless/ath/wcn36xx/dxe.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/wcn36xx/dxe.c b/drivers/net/wireles=
s/ath/wcn36xx/dxe.c
> index 801f1218ef..7852f71368 100644
> --- a/drivers/net/wireless/ath/wcn36xx/dxe.c
> +++ b/drivers/net/wireless/ath/wcn36xx/dxe.c
> @@ -552,14 +552,14 @@ static int wcn36xx_dxe_request_irqs(struct wcn36xx =
*wcn)
>  {
>         int ret;
>
> -       ret =3D request_irq(wcn->tx_irq, wcn36xx_irq_tx_complete,
> -                         IRQF_TRIGGER_HIGH, "wcn36xx_tx", wcn);
> +       ret =3D request_irq(wcn->tx_irq, wcn36xx_irq_tx_complete, 0,
> +                         "wcn36xx_tx", wcn);
>         if (ret) {
>                 wcn36xx_err("failed to alloc tx irq\n");
>                 goto out_err;
>         }
>
> -       ret =3D request_irq(wcn->rx_irq, wcn36xx_irq_rx_ready, IRQF_TRIGG=
ER_HIGH,
> +       ret =3D request_irq(wcn->rx_irq, wcn36xx_irq_rx_ready, 0,
>                           "wcn36xx_rx", wcn);
>         if (ret) {
>                 wcn36xx_err("failed to alloc rx irq\n");
>
> --
> 2.43.0
>
>
