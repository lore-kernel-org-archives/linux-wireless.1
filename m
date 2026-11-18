Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795033762;
	b=cxL98vHwu09dsC0gNbXp6SGFZJgteQcv1uUA6B7KBLSW6npqOatyZgjmjzo+t9KRbGDF
	 B6AkLC3x7qP8qhTx5bDZaP06pz4KJDk6oV7ytHUUnKWBgBvgvlUu0afTl97K6TEKFlb0C
	 ToGOqNM29Dc1Fg2wOtKh1EQpVV7BqlrGHQXykpszk4dvFmLpU7SVfeOLSWnKcw8OBcy5c
	 aIl526NTelpnE009bak+10j2I6VVrRZRwMbr13+HuXhLWTNxKKO9cvDBnR9HCLltdTS8F
	 qsb1KlX5R4TYAHYBEWYnCfeqaU4Tc89R315CuiDyG4SEEoOrjGxvfcvrRcf/HNDoRZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033762;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Uafzx/JmUMCcPdLuNnrhGFghiuTegcyFvb8LVqv/8Rw=;
	b=1tqckF6t3j6MN8a3MhxsmdEfu8B74Po0+yhor2WrbUpxyIGWjw/PuD5KTZ4sXpbWWUSY
	 gbeeEPpleqo6KQ9kzl6ZVGx8W2L3a477f6R9uESBgRjR1EldOm/RFqQXaezov7ePZj58f
	 JCf7JD7XiPej5iSRWwdY+1rLA5yUvunbF1NjZU5CuHDThH7gXcR2jMk8wOva2HxVTUSNh
	 Of8nDRXWhzta703D+JKcYmMPkcyFZRfHkViQ05ht7lm6jSJcC6iP6AHkuU32rIM4q9joh
	 af9LP1CdOuBZFpc711gepnVyov/jefeUZ7hiRTQrCvSi8vu4wEfhs9I2Ruuwdai//9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NpI+AOGN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8458eaM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC89606A32C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 20:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AC89606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NpI+AOGN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8458eaM
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIJMJMI458267
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 20:29:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uafzx/JmUMCcPdLuNnrhGFghiuTegcyFvb8LVqv/8Rw=; b=NpI+AOGNxh4W2ZLD
	HOhzwaT1akLSDIlW3XEsOdjWcgZtMs+ZQzFqVnH0kSism2DrVDPNt7XuhBGa+yBB
	myuAJpnzgpSpvTzVy8zYvhSq2YgsSiiDChItUZvNSWsfkLu3MVtL1jqQuNgSm98N
	5gGsos+cgu+iBbme89DgppbYmsFNawnBS5rWhodvpB3Cl8W/splxREx2A098UykM
	TIirVzER2HS/GCATtoB1oCp2t4ZQHIVGIw/XE2aAW078PdOaQN3OdYh+9KqAU45n
	O7MItB4FTn+ge8u103d/CxOxw3jawwp3ZzYggt+dXCyBeyAcb2fobnZlG7L9rfix
	nxAFqg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxcrmts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 20:29:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495dd0f07eso298326585a.0
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 12:29:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795033760; cv=none;
        d=google.com; s=arc-20260327;
        b=YZIQlMgMAKLURTQTE2TCW0+odkH++Ipl5qFaHBSeiwwo/sQszyPQ30FzbOZsMMXwDY
         jWn5Vp51oK6a13kwU6pvU86/51LKaoKk7gzavNzX7dT0vZfwOGz3UouRkcSmCZ4JjRjU
         VEta8A+p+Y68+TcY1uMR8RxhIDdlc+CL/hUDzJrq23wxOiJnw83psJbwQJFdv82vWRtN
         jseoeTYpLVsHdGrYiAvaRwaztBt9wQVgsqamknA1PIABYtu+xRz/huxHutesjvmYwbay
         +93MkF2k/bdkPPYLmDl2pOxE/ZR4Pfx5mFmrYBw86q/zLx/m+EpW62XgndZtwUJTL06u
         qrmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uafzx/JmUMCcPdLuNnrhGFghiuTegcyFvb8LVqv/8Rw=;
        fh=ERLlvfEcagxf5yNuNgtZWnc7CnAnuW/B/nylqa2tmwM=;
        b=Y3yiAekFgHpYE2IRSmnhrFW5kK03UNNO6Ij7/yDft2Tf+0jIr7qEEIGUB2ukLelZuT
         304dfYXbFhFJ+fcmMSwxSm91e6+7j/gobBTEDjsiNfnHTwgJTabWq0PKZpC3T9RwANNa
         YWyxAmAMhVE+PsR48FluqoRWjx4JMMJu1u8G1BxkSVnL5ZHLXIq9ECwlfyhoyR+om/Ai
         mxRyAiu1B44YuDmXwKk06lI1oy7tLwf3INBkQr7ZZZU64TTxzE2bAQ3u+uYLuvrt+b7O
         HlY/SLCono3HdOOqmm/3RqM1TCYqdXx2MH838DEENejaVAIKGOjF3KkgJRREeDHnxJW5
         Z0Vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795033760; x=1795638560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uafzx/JmUMCcPdLuNnrhGFghiuTegcyFvb8LVqv/8Rw=;
        b=i8458eaME8qijPCjB8rMf3haEX5zO9kXHS2/pFcOdj/qJUYKCYc5B9KV99f44W/C96
         +0p0AWaxAtC8eDMiTkCizw/nSkm75K2oOon8wbFwd6l9/DCkZ+g2aSgk6mFHYGARxnEa
         mJmcFw+UEgtDrw4WsFiKjDkacswXaRK5AbWvZERemiPFkkZWvZU0FzK7Rd6wzoj248Sc
         5h+3gfU8rJtBMWn/XY/Hu9HC0GY0Shu3uYIb7ZtO5Bf15djfvE0ihD0CJkXGzCLJY1x8
         +TcAT/64QQ6P50aVokCbS4YfSX89l0l8CacDW+V3boG78bztZ5GJwTnEhXs9xeu41748
         Pz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795033760; x=1795638560;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uafzx/JmUMCcPdLuNnrhGFghiuTegcyFvb8LVqv/8Rw=;
        b=0k4z5v6m0k84ajXPtbCJkhu4VkKAdY0gxgqd9aGupe5t3rtuLkhMBHmcR+SG5UaO6Q
         69H8hLO7/TGW+MJfxirh068YjKs/mhi2e2rbWFn57n0tAKRTUqAOStU28JplMrTnxVEC
         HjpOT1pkaMXHsRSABX3Y6Abih+ESlsD8lQ00AnS39N1N+xDgzG82GjaMNvzU68ck50Sx
         TCmE0XyM1liDYUC1zwEIJDEcG9gbNSs5tpsOYun65mYLko7/Qj5/fd79G1tmzT1PVt9J
         qUb6/J6EbQ+b1o3Ndj7PyjwhPT3PDwWmdbsyAfFiVYxZ7/AQmLNaWIH9BE+BPVKtRqar
         Z0Kw==
X-Forwarded-Encrypted: i=1; AL+hErEpfJ5hvH+lswbGJquZFRpqAH6kxmROvg/DilTwg/ho0VsRfqVYpO2LKaZJcCkzBasokxBBqoitDR4DSSsGag==@vger.kernel.org
X-Gm-Message-State: APuU4Z/RNi+VCkCbre9iMH0F4zrThme0G0U8MMVAsB10SYJ/C30gDlHE
	uhzlt52swQJv+0QRAWBWQ6Im9rDEs32ZIyQQ8LBBNsMf1xZwDlVKk6JTpK7JPOeAsVo2l/Tjd3+
	WES3s6kNENiRmFxo0K8XNlff3JboqR/nmGorMEg4aCWtVwsFvp+b0x29E9Oprjb6PgpQlxqujuH
	xuqgfq6x/Pihf2RE9p+QUlt4npxcpH2kbU7y7rC0UpicCy
X-Gm-Gg: AYBFou3mehNpicauucmV/JmayOfij3696Jss0X0J2/dl2c49MQc234oqUjfdG9ei3Jo
	VmrnPDT3H1pjL0iiR7kEC6N84Kqbx4RofXfGvaGkc+Rfxaaoh+GpoidTVPRN8U9QnZxWr5oy37o
	3P8KV9CXOkOxVg7zJufyZuH9ElWfs/UEDJWiEXnInk1S/o78kzjuSvaZV4e3TwCpa47NAmlu34B
	O4d5e6WiyYVMFAgdHbwChKT/LXA43yxbf6xCqrbmJZT8tAuEeru7PChjXzccy+5Jx3l9BG0DVg=
X-Received: by 2002:a05:620a:a194:10b0:949:9f1e:d8b with SMTP id af79cd13be357-9499f1e0ed8mr341706785a.16.1795033760276;
        Wed, 18 Nov 2026 12:29:20 -0800 (PST)
X-Received: by 2002:a05:620a:a194:10b0:949:9f1e:d8b with SMTP id
 af79cd13be357-9499f1e0ed8mr341702985a.16.1795033759630; Wed, 18 Nov 2026
 12:29:19 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com> <20261118-wcnss-series-v1-v1-3-a64d82e151bf@atlr-engineering.com>
In-Reply-To: <20261118-wcnss-series-v1-v1-3-a64d82e151bf@atlr-engineering.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 21:29:08 +0100
X-Gm-Features: AclHuK8JJhcd52hfVRf5gMzyZMF7wsPFyMwkvy_HKeVTiizUypnXwZQFHaYWU2k
Message-ID: <CAFEp6-1OnG4B_D59fW4WJeTOXAs-Jm-0Qg+yqwzM3j6tvya7ug@mail.gmail.com>
Subject: Re: [PATCH 3/3] wifi: wcn36xx: Stop waiting on a dead firmware during remove
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
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6afe0aa1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=Knk3v0qlAAAA:8
 a=fXm7JzJIL1tcRaoap_oA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=L2g3GqtBoyQv0ocsUjqh:22
X-Proofpoint-ORIG-GUID: Z9kacFhnk5X6q9wQ7hJ69gyWOAQ2lPZp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX/6SVPDX0q9Ce
 I+Ev2onJE9GSHnOZSmzCcQrALDZ0Oy62ZDMdiefeGX2pbjC9RZPpnaDF6/3A89o7krhGe3yGSMU
 2sW789vNUOF34/Iczu2B17mvfMoWep3OH2fh3APsUKZXfhmy7P7qgJflui0TE+S0msHEXt2CrMn
 lXEyZDVtejbgvIgAwkHJM4bj74EmU6lUcyXI5nLKCpfHuJdYATNWv0Bv9JLMyhr51UnZYnLBDy1
 sECvdLoAzqSMztH7JiL6apzOyKSId3MGC+xxQVgTRGzMbygJqbNJZ2QboNIzMcnX4nlnRzgtvLR
 zuAxxrg7AK61Cebd486dIunbb4JZV6YfMoMUNCqJrcnYMDRhV9iArY3KawnngyaXEz8OMjZgptY
 k15IUF8Tk88/3HJHED6eDD70zo4Bmvh5zDtab/Y95zfAubphJ1l25bnkbzLMs7dYGibVzaL0v47
 RzKgisV/Xi0H7fVqdoA==
X-Proofpoint-GUID: Z9kacFhnk5X6q9wQ7hJ69gyWOAQ2lPZp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX6tpLDC31/OQI
 idlS+SMGsTmEBvnnAV+pPKNkrOrk/PLC+VNkkhFjJ9sldxElNIv5mnwJbmEoj8v+EwcwP4bN7oy
 34BY/ebC9o8qsozWjEqsfxvkQH+2/5w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180077

On Wed, Nov 18, 2026 at 3:58=E2=80=AFPM Alexandre Rapaille via B4 Relay
<devnull+arapaille.atlr-engineering.com@kernel.org> wrote:
>
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
>
> After a WCNSS crash, remove sends ~16 HAL commands nobody can answer,
> each waiting HAL_MSG_TIMEOUT: recovery took 160 s on msm8974. Once one
> times out during remove, fail the rest at once; recovery now takes ~20 s.
>
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>
> ---
>  drivers/net/wireless/ath/wcn36xx/main.c    | 1 +
>  drivers/net/wireless/ath/wcn36xx/smd.c     | 8 ++++++++
>  drivers/net/wireless/ath/wcn36xx/wcn36xx.h | 4 ++++
>  3 files changed, 13 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wirele=
ss/ath/wcn36xx/main.c
> index ad8a4bd910..77a1029108 100644
> --- a/drivers/net/wireless/ath/wcn36xx/main.c
> +++ b/drivers/net/wireless/ath/wcn36xx/main.c
> @@ -1651,6 +1651,7 @@ static void wcn36xx_remove(struct platform_device *=
pdev)
>
>         release_firmware(wcn->nv);
>
> +       WRITE_ONCE(wcn->removing, true);
>         ieee80211_unregister_hw(hw);
>
>         qcom_smem_state_put(wcn->tx_enable_state);
> diff --git a/drivers/net/wireless/ath/wcn36xx/smd.c b/drivers/net/wireles=
s/ath/wcn36xx/smd.c
> index c0b4773458..d07ea967ac 100644
> --- a/drivers/net/wireless/ath/wcn36xx/smd.c
> +++ b/drivers/net/wireless/ath/wcn36xx/smd.c
> @@ -427,6 +427,12 @@ static int wcn36xx_smd_send_and_wait(struct wcn36xx =
*wcn, size_t len)
>                 (struct wcn36xx_hal_msg_header *)wcn->hal_buf;
>         u16 req_type =3D hdr->msg_type;
>
> +       /* After a WCNSS crash every teardown command would wait the full
> +        * timeout; one is enough to know nobody will answer.
> +        */
> +       if (wcn->fw_dead)

It's not clear from the commit message why you need two variables
here, why not simply testing  wcn->removing.

> +               return -ETIME;
> +
>         wcn36xx_dbg_dump(WCN36XX_DBG_SMD_DUMP, "HAL >>> ", wcn->hal_buf, =
len);
>
>         init_completion(&wcn->hal_rsp_compl);
> @@ -440,6 +446,8 @@ static int wcn36xx_smd_send_and_wait(struct wcn36xx *=
wcn, size_t len)
>                 msecs_to_jiffies(HAL_MSG_TIMEOUT)) <=3D 0) {
>                 wcn36xx_err("Timeout! No SMD response to req %d in %dms\n=
",
>                             req_type, HAL_MSG_TIMEOUT);
> +               if (READ_ONCE(wcn->removing))
> +                       wcn->fw_dead =3D true;
>                 ret =3D -ETIME;
>                 goto out;
>         }
> diff --git a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h b/drivers/net/wir=
eless/ath/wcn36xx/wcn36xx.h
> index 8c43f67bd7..9e5f3918ca 100644
> --- a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
> +++ b/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
> @@ -276,6 +276,10 @@ struct wcn36xx {
>         spinlock_t      dxe_lock;
>         bool                    queues_stopped;
>
> +       /* Set in remove; a HAL timeout then means the firmware is gone. =
*/
> +       bool                    removing;
> +       bool                    fw_dead;
> +
>         /* Memory pools */
>         struct wcn36xx_dxe_mem_pool mgmt_mem_pool;
>         struct wcn36xx_dxe_mem_pool data_mem_pool;
>
> --
> 2.43.0
>
>
