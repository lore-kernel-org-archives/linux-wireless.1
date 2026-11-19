Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795079121;
	b=nmByhAtMiCCh1YYpwoTnsF8fxGXE5+hjh5ZhKpaGRfU8rPnGsCWBGc//7PjiSORtxhXA
	 nFnP+YEhZdG6yuMfizifsqM4QfwMSUtEnqGpSx3hWPM3BXfwRKYwH9j6uog3u7J+Lrzy5
	 eqdbC13oFPuVM92apBTyiqcKvkZR9a/0zgXb8YvK4/9GAqABLFP75+K1I4hKQDaH71M4F
	 +WkDmvDyltl/LXPMe9Yg1ZKQ9P4AHipUkVu2kY7/At2YoNQqaVC9WtkjdsElg6uRdeljh
	 wh+uAqa7cKN89XaVL7eb4oM7odhDi/5PCafuqfGD1uMcNhaQbOIUBnvDnfuw04v1YOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079121;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M0MJXOkn8zdc+gwVeKxQQDexGNiCXPcc+gYOOl+OuiQ=;
	b=gp3wBaiEfMmrdh0KaKSOxbFvq25pxJvrSMpb6exddaxp6Q1y5SzpXtzXs+M0A2hFE1o0
	 69a0q5+LuPe/ykvQisVA9HgQFx/4D7vx96YTpRNnFBxtB6G5OpqpQkQ07J+bQqTj5d5lp
	 BoXU5sp8XeSyFfslJEr4OLPtrXQWU6Dg0/GudZvU+RCchzu7/x4z9TmNO+r+1X4MSeLHi
	 hZugWCMbBP8GL3svo1nLwVLYL1Vs3fpnTWiOogh1LyyMsJUv6xP56kozzdwAqcyvURcE7
	 UFypaH63MuOUcnLUm1w2AJNDCNySmu8UD5Ra4XB9GgOWB+suM6vln7z7slmN3E7bPFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GaL5S0Np;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zhrm4Co5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6862260A2617
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 09:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6862260A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GaL5S0Np;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zhrm4Co5
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ7Zn8o3718097
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 09:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M0MJXOkn8zdc+gwVeKxQQDexGNiCXPcc+gYOOl+OuiQ=; b=GaL5S0Np/e82jLi4
	2RnY2BBKkZLVSl0AtfjZXaJBeSIt4k2eoFEkdNZoPRRQCcwuHR2je+CbCCJhjxT2
	qFEtzE/ytpmE7E11HwPkc28KETBPXZW3XSFjFGtSWoVqIRx8HrAJzh3AuSwqxfCb
	oaiQNQv6UH+BzwPw52PQhrm+255XGNyw+/yuYOWQ6lQQqF2TjxskrgiYEfLLxpt+
	SaVZlJvGbhAnvv9KIoc/jaV8s9xzBCXEwpn2zDPceEltTUS9Fnm4AVbxCokA8GRu
	PaRVP4bR0d9mQ4nMKe1gi+1xCRBDTYg9Xoqwoxws7Ct2B4ymeZnSCnTPhMJQzFqm
	Gg7fQQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1vv2rctn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 09:05:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e92aad34aso386294485a.0
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 01:05:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795079119; cv=none;
        d=google.com; s=arc-20260327;
        b=gT5rW+VC/MAv6507Jc+r4it0Z7Dr1yloGV4btYbDrxCdLkOhhZM8dQp37+vVug3PTl
         KtmwqUj9e4cbZ2ktlymNmnotmZJ7+RlWh9s+DVSgPpV+P+M67RVR1MDHbab10O8W0ul4
         jamusr2xZiDUVSYdBq/CsRDmnZr4XiS/Ou5idixTLPWRxlwZBtzVMDBrooywwxHkbxf0
         xruHMvCS0fraMFOrsNxndUUsvnlBW1N80gXcIIhr/L5ug8gKgbNzRt9l47n8y7WAqlWn
         Ogx+iriYLJRf8CVJfUt86epLUgHSsNb5KD3FmuHgiNqOhvCKufwbJFS1zq3f8VXJ5jtw
         gaVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M0MJXOkn8zdc+gwVeKxQQDexGNiCXPcc+gYOOl+OuiQ=;
        fh=6PxmWBPCsGcMeXb44vOjZUVGOTHc2jd6HzukSvDyo7I=;
        b=f6XT/sWccuG4QVzUUemEsSa/5ly4td0LqhMbBCPrUJbFeJ7zgIf2lzEBDpsSLwXK6v
         z976uBS/0MBFnOyCpNjRGLlD27tcR93+cJpQ/nS1uEVJD0MOrKZ0RjkMGBLIK4dfi2sX
         IQ7glCz2ER1XPamDejTJx/hqyRD6MerP5RdyN9VsJnPUBF8Ui6zaAx9P3fH3C4LqQwyK
         fs2s+oCZwmYTGazAMNOBp49UCbBMvME6l7GLH0EM6JiBcgkqfIZDDNVIj4CRlP9gl2PW
         aum91ryAs8XX8VNchOxkmuy/QE+78HvhpkJ97uh5UjI1v2WmGcUdbxS9yZxp+ZvrW0nJ
         XtFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795079119; x=1795683919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M0MJXOkn8zdc+gwVeKxQQDexGNiCXPcc+gYOOl+OuiQ=;
        b=Zhrm4Co5VzIAgsW0YSam8Q4E83eIf/guf+XkHo4BJi7k1X/P/uUwk4LhpLN+hL82I/
         /LtQXFGg5HrvG+hPp0a0z5GcgLw5gII/vC07zAux2vC8NRfe0BcHacdoZTt+LjwdNFKS
         mbglau8/CZB5xd35WLf0PFAedHcygwHhgMleUL+BeLxKUlDVPg41W2PMD8QPz49RT61Q
         oBJcnLeGMGe+r4A/TTep2OWimNcmk62+5osqXvDHS/b2dnwwnii7GRZ7DoncNoiExdR4
         Kl5Ny6uWxsvYVuBaOEF8L4dfCHJzTdQNwT8gzwHxvZUxlqtigTAPkzF1SWeoIg/mm+qc
         HPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795079119; x=1795683919;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M0MJXOkn8zdc+gwVeKxQQDexGNiCXPcc+gYOOl+OuiQ=;
        b=aKoEgkBB2libNehcoSF38FRs06X8hFOjeiBCFOzSE/u4xd/E/2LN1JzT1+BKX+q6FN
         Erf+bFfX8urIaZaa9Eh6Yo9kVy5ipZaPBHlri9j/f2Zes0lulUVkGuXgvR4S2oNI/+uE
         JKZ49A0nUMCi9rwOBUxmJ/vWnvrtJ99uKfkRVgQHLqIwLEUaq/hLUZctGMoecJm7NNlu
         iUYo3wUiagUFpzHUu+Biqo8yIO4mIMx+/ppplxxJ97lpNCt7wCZsQq1OGNI5CvQWsN+K
         uVPp/9KacbLvEfO7uBy30SbZ87na7OBvvgk+Xq1NTSwN75ZQxwm2Xq7AdxNdQ6Q0WDAG
         zO9A==
X-Forwarded-Encrypted: i=1; AL+hErGYdkFF3llI5jKWp8/J5384ofgvFnCxjuBzb1z0Oaq3FL992PzeLPk02Sr2tzHqJKOlpc+X4Xwo0nHJ6rPjZw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8o0Cv92pdh1wJkQGq6ZrUfkhtEWNGSNHcJ7tPwZEFplnghX21u
	AJe/lRah7rp50oYRot2NuoL7YPCxyp8xnfNY1Z4IkPkCks/oQp1sBYSAUg2V2v76v5LTcKN6sEG
	I66heVWZG/LoHuhOrjcCiZ9Z6LI2ZNqn+3/cu315aJiLhTLNtoDQ5fuSiobsr/ya2t7dsDkjzwh
	OPV8edYJs5yMEC+8O2g+/c7NwGkVgue+LwjzIf/suGwcAX
X-Gm-Gg: AYBFou3VUB37T/CLyYAbZvF6acYCjoH7bT7c/g+iXvX46I54fCXyNwoEU2LLvb0emI3
	vZRw5eXRXSrAhjvVqVWVxSTK3Og/P020382xxu1mCN1Y6wzaFMEkuj3rDuXTI5+fl8dMoAzLx+X
	CPJq8rvk9rVvp+FlpTyQHSo2v8F6b3VIvfNaN5JUbCJ+p5ievDFnvGI3BNTre5X73EyONxEPKbe
	/5ek4JbALR15v8DkkaXcPNwFcSvJO51x2gcdZkfsnZjicvERvU2/GEzDbUzoNyAfgrnYoHK5d4N
X-Received: by 2002:a05:620a:45aa:b0:949:3ea1:3021 with SMTP id af79cd13be357-949996055a9mr954535885a.68.1795079119218;
        Thu, 19 Nov 2026 01:05:19 -0800 (PST)
X-Received: by 2002:a05:620a:45aa:b0:949:3ea1:3021 with SMTP id
 af79cd13be357-949996055a9mr954529985a.68.1795079118704; Thu, 19 Nov 2026
 01:05:18 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com>
 <20261118-wcnss-series-v1-v1-2-a64d82e151bf@atlr-engineering.com>
 <CAFEp6-0sYs0mEm+4E_zEgXcSjoYKwtW_YJSa601gb=717Gec4A@mail.gmail.com> <DB7PR06MB53249C2E9D190088A52CF72A85792@DB7PR06MB5324.eurprd06.prod.outlook.com>
In-Reply-To: <DB7PR06MB53249C2E9D190088A52CF72A85792@DB7PR06MB5324.eurprd06.prod.outlook.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 10:05:07 +0100
X-Gm-Features: AclHuK-GXDRQYMjZzNUPKgixOWRkc2SFP2WEVl061PLLQkCPbkUsldWxw4HirwE
Message-ID: <CAFEp6-1AWQg+rpnZy4w+4khc7PC8CfT7drcL4j+upDWniow=4Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] wifi: wcn36xx: Do not enforce interrupt trigger type
To: Alexandre Rapaille <arapaille@atlr-engineering.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>,
        Eugene Krasnikov <k.eugene.e@gmail.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "wcn36xx@lists.infradead.org" <wcn36xx@lists.infradead.org>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: o3t9Zkkbk0vOrfgNW_60dVnI_PHTu4Xz
X-Proofpoint-ORIG-GUID: o3t9Zkkbk0vOrfgNW_60dVnI_PHTu4Xz
X-Authority-Analysis: v=2.4 cv=ZZWIpcVA c=1 sm=1 tr=0 ts=6afebbcf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=Knk3v0qlAAAA:8 a=s-NlbNPW_lAo8gpM8kMA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=L2g3GqtBoyQv0ocsUjqh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfX3J+NwdXDfFzK
 jOWNwrutz40LM7e9UTErcYO3jz7ecqwOJsko03TJY7BF93eKdrUUQWrsKWBrR6t1aIldsdBBDRL
 5nAn9n7G6xKTlyhutVF5P3HjAwlLy6A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfXzYUj/K+UawWH
 joCoOMCtbIWwO/7+lfT4VT/pkgpksUkCZwhu9aw8Odbeh5feRktaP463oA+QeXDWpJfckXYjatG
 4ubXaQ5m3HNnSAu/mu2PQi3Fcsvt/ShK2Dg4kXFJOyRkxAD6g54z0ZPg2Zw3H6+lEhBIAK/Qy6j
 J+v0oWS8ytX1+wSW5V86NmTMK6wNc+Uvlpyxxcx0O6Y6NYrU37ZVydDXk7c9UPJZ5OMiGMnU7pK
 4euKhg1EullKAIIEAFOwc12SGGhvNkXCi2POrwtpXsnwbCg+Yh4vztjpCaLflUWHB3W4sGVpPSx
 zBr/FLJTyIMX2NczS6wU5Inl6NKH7djVoGzAS8NGYjYmmWKxcdx6DKrIGFCXxCNxKcWs0fKHC08
 rfEbHLd/Z9WdC3yc5vrSfsQ3stVQntGWTipObwccchq0U90Jykc23xSHhKN2Tybs6gaRctCYd1M
 jc0o3Kg1E4eY2PMajWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190035

On Thu, Nov 19, 2026 at 7:59=E2=80=AFAM Alexandre Rapaille
<arapaille@atlr-engineering.com> wrote:
>
> > Can you explain why it fails? Is the fix at the right layer here?
>
> On the first probe, request_irq() with IRQF_TRIGGER_HIGH overrides the
> DT's edge type and stores level on the mapping, which outlives the
> driver. On the re-probe after a WCNSS restart,
> irq_create_fwspec_mapping() finds that mapping with a type different
> from the DT's and refuses it ("type mismatch"), so
> platform_get_irq_byname() returns -ENXIO.
>
> The fix for that is patch 1: with the DT saying level, both agree and
> recovery works without this patch (30/30 forced crashes). This one only
> stops the driver overriding the DT, as ath10k does; as Luca noted,
> every other qcom,wcnss-wlan DT already uses level high. Happy to drop
> it if you'd rather keep the flag.

OK, then it would be good to include that information in the commit
message. I'm also wondering whether the actual stable fix should be
limited to patch 1. This patch could potentially break out-of-tree
platforms with an incorrect DTS IRQ trigger configuration that only
works today because of this override.

Regards,
Loic
