Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448378;
	b=uD3YW4Bj7CN25exPuGC100V/8T6qifBpGDl54uAhjqtYQfbhPwna6GBFFxSPDwQmWWvH
	 hNmOLnDOZ0MPy0wWu7fAdF6H2gGxI07nyZXh31qyrEPOSRoi3msHkiVwWzQvB69dHRvla
	 xN1MWqdYB4yo7ZAWhpihx55jM4jM8gW1ifKiNzxADiQ699avJjl0GKW98tJOowS4F2ZSh
	 7vJd2JHqhKGC3yZ7bHrrJRlSFhnLVkatHtAZZvGrpwoCrGsDdDgigvaUCdi8v4upkc4bG
	 DcPjrNlUHESIGXugkToDq9GvdAJfEacczyOGBoU/rtIAVTxc+VdKmu4+qA9ONQRQZiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448378;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Q2dJwtsIOHb1B1Fx3r1nM+JuGNVZo9J8lJ9npEOZltg=;
	b=yBZ019iJQ2k4QfniYpKG2NC63kGFXSkvLaEh3WkMaT7ztyUsvRjlXoTCjeMAGzjhWsd0
	 VozJbBsB2SCJWoJaXWXi7ENelYXKn313qRk2Nlorbnsx8ZWXVAPqfTdZWjFv7zZaGIcie
	 wzw2eXUnJ7TyVfmOqAOJRkcuc7CWhTq1j9agEeTUwRoAOqr1ZJb2ab0BwOHYwkGp/7cAW
	 +idh9kymnaitPOtRK9sdkF1LLdfzT7g+v173D6i6yGfYY9O5fpztU4KYeJ2rOrws1rUlt
	 Jf2jvMLFsbtz3OsCQy9XeKL+L10EEVEcw9aGC0KHQR6lsFXnwwxUtel0Yh8qCKgli3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eThCyj5J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SU9L7HdT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CD9606A31A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 15:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01CD9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eThCyj5J;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SU9L7HdT
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLSPY1461855
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 15:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q2dJwtsIOHb1B1Fx3r1nM+JuGNVZo9J8lJ9npEOZltg=; b=eThCyj5JdNxBibP3
	6Mn46VkvXbbU5MOIDoXPtfUQvk0/M0DvPuIiLlk9J57EsAu0TZabSuvy8wrHLq22
	rySVbHEnT8Fdgg/ry/BT56mtCr3m6HSbkEag77Osygb0lbATjmJrbmUj6dhHxFW+
	JOAp1nAU+Tyh2O6iw1iz5f9vNe4nZj+oiYkTXk7FMMRMOWz9JWNQISV+WzwNPhdj
	CPwfwHV1Sj47+VK3AnZfmKufp0V/QYY9Pwli2By2e21X4dm/Ge49auMZXv9BLdkQ
	vC56wi+KoF346ejDjvo7BCSonIJXEGUBh4ydB6613RbsOWHWFUPN45WIlwTgmZPB
	Y0gVGw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a22se-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 15:39:37 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ecba171914so99310e0c.3
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 07:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795448376; x=1796053176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q2dJwtsIOHb1B1Fx3r1nM+JuGNVZo9J8lJ9npEOZltg=;
        b=SU9L7HdT33GJtLsdm1Gm9me3IELbRLH7k9X7Wtw2YoI+8xfO/1sdyy6GikzEguDA53
         Z8O88b9jlHd1e3sVInhEz2walGmme1gBHf/Ra3eE1tjubgxyNKcWU9WZ7k2F8glO3ngA
         Ubzv4f9h+vACPRgHlZzJ7kYrnSBrRAyQe1fy11E5zl9R2ie8e29H+jF6gC8M68WJRiWX
         5EE6CVho0x9CJeJ33vgcfIWPihbAz6voiFoDQjkXai//x2BPq5aZZS/MU/6+bQJs/E8+
         EInjQpibMN+I6nhjDxGoBgMuJrlLZNGvM9k+nBpimOEhpenXFQLLBT5rXPrkEB3tOLEW
         ZTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448376; x=1796053176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q2dJwtsIOHb1B1Fx3r1nM+JuGNVZo9J8lJ9npEOZltg=;
        b=xA0XP/Zwr8i1MlBM8IEZ6xXUTJ2f9Hm9yBruABm/xpfp9cXgH+4QE4jg1UN44ESNaZ
         VhqZ9pRMmmIe7cF7bzAHzSHW21N8vhpiqtPRMtl5tOa57H5i5L7MhP69FZEnWhQEpZKT
         lNbXtcvILRoqDHda7iMIGhIGxUa15qm6xnKl8SllbR2LjvSZo+919ovzAyLDwSIFgVwX
         5CUoJRomN0rkOb29A0Dgmi3SGxCs5N3QE6uzxM5i500tbesKsrO+PYXle6dFqafyHkfz
         PWLhgLN5pDA3YCkEqWekVoNr5JXXN0yZgToM3qvkmK0ucqXXHA0lRFJy8WjV7mlwmUXE
         46cg==
X-Forwarded-Encrypted: i=1; AL+hErHm6ExPdErzzdLTDSZxvzT3xKe23CZBMh4aeFheBVTTOgC96+nD6BxdYV85z9iQPyiprRq7qYIAMsW0A8kJBg==@vger.kernel.org
X-Gm-Message-State: APuU4Z97EeMS58ux8LxXMrpCjHByLu0v8LiD9HD7J2LxDxsQhaezXeXH
	iLsFdHRyY5uqPQQfqYNVrWfiXt/UbxhUX0B3oZHePvfEYGBq/hBJBkogfZyXJB+f4HUzCUtSUwD
	D5lGSqu3OuvpfAYCXCiDbOTkmVdI85WEx0fLqhob9VC7ncSWsYar/9ziJadHiO/rrhNFHdQ==
X-Gm-Gg: AZFdTZdvNx9h9ZFg6RRGlotOGkL+qI9oZp+NXDOm0YrrzkHMrRTnt14NwMnDrK6e4Sv
	y6ZmJyl+Jr6nDLme9RKGYA20tq3prG/FXe0cdyO0rVYNxWZQ47Hew+AxZvJMr/vbW1DvN8RBRut
	KD8yWcaw0mCT3MfHUQsTkAGETN+91QiAr1F2PTsvkzZW45FNzCkOiQGfMk7a7soWKZVWG8r2SQ0
	E+lsgDzCBqfUVhf/7F+yj4n0qrB0hiPW5SX11qwahcw58RjFAzJx+bMmalwgr+dakrHpogPy96d
	4UjKnMo7uVkZDS61DQovwV4B8G7r5545cXZ0+nVxTQeZBNGid1yOfStKOV25WztRqiGiWaVWg8p
	SvSOA6Izu4QL+uB0DzQCIgdvcM1PJEBMRKKpaISNdY+jJdxev1TEolqg6/THbq1hOHuVjF08=
X-Received: by 2002:a05:6122:3a19:b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ee8ade9b2bmr8021141e0c.1.1795448376252;
        Mon, 23 Nov 2026 07:39:36 -0800 (PST)
X-Received: by 2002:a05:6122:3a19:b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ee8ade9b2bmr8021082e0c.1.1795448375818;
        Mon, 23 Nov 2026 07:39:35 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm425248766b.63.2026.11.23.07.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:39:35 -0800 (PST)
Message-ID: <65e2907e-a856-4496-886d-c9c3e8ea3351@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:39:32 +0100
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] wifi: wcn36xx: Do not enforce interrupt trigger
 type
To: arapaille@atlr-engineering.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Luca Weiss
 <luca@lucaweiss.eu>,
        Eugene Krasnikov <k.eugene.e@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, wcn36xx@lists.infradead.org,
        linux-wireless@vger.kernel.org
References: <20261120-wcnss-series-v1-v2-0-3fed518decfb@atlr-engineering.com>
 <20261120-wcnss-series-v1-v2-2-3fed518decfb@atlr-engineering.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261120-wcnss-series-v1-v2-2-3fed518decfb@atlr-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfXwF3Ce5aH6Rs/
 PWin5Aq9/MJ5TkyYdy/b/VG94ju3Gm6Gd7D9cDXfMjnlT3VFuv6/kVq7m68v0MbEEewO/DAozcY
 P89XcjU/d0uVDNRTQ5FWr833Qc93I+w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX8dwXm2ueVHLt
 xoIc6J4no0dCP/+kBNg7q9CNQ/PPlydCjTig76YgkdMxziodUGvXBR3IIFDh2v1l6J3oaureWET
 IHryuIxFVTBYnwUWCTjMHC0oP3lzCBNP/YJSiuaNeG3JyL1ULhBPjGbhNXTkD6RN4WoBd4bFpPk
 LYDrNNqvmnuy42S0oJiJbGAU+3EYu+Se0PwWQ2LEd/8ZJfHJRGbzrOoM4kbI2VNUlwyhPrCK0xy
 gb2zlAmvL37pC7Y484OA+5ZESfp0CXv7tsr2Jn1pkPKJXIxsqs5DKLzmGMOVpo5mtHrCTL4vyab
 lQQCb+fdgxwWp0Q4IRYfpdPbYKZcAhy/45FbkwNdOHIHoF+6T5EnaVd73SiDKoARbM9LEqaow/p
 r8YkL3PNG4vr4DznGqP7R0bIVf8Ms3KGBRRnGW8y/3a97mCMDm53sKq0y1wh4Vfx0ItsxMM3to3
 sgrSb1XGHDg71WPev6A==
X-Proofpoint-ORIG-GUID: Y0UtUQuPnSyP-boUtKr_KyTX3Z8zFgET
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b045e39 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Knk3v0qlAAAA:8 a=wt33j95wQlzQpC1BO6QA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=L2g3GqtBoyQv0ocsUjqh:22
X-Proofpoint-GUID: Y0UtUQuPnSyP-boUtKr_KyTX3Z8zFgET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230062

On 11/20/26 9:05 AM, Alexandre Rapaille via B4 Relay wrote:
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
> 
> request_irq() with IRQF_TRIGGER_HIGH stores level on the IRQ mapping,
> which outlives the driver, so a DT with another type gets "type
> mismatch" and -ENXIO on the next probe. Rely on the DT as ath10k does;
> every in-tree qcom,wcnss-wlan node is level high (msm8974 since the
> previous patch).

Drop the last part, this won't be ""previous"" patch since it goes
through different maintainer trees

Konrad
