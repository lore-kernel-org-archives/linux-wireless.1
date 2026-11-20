Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795198556;
	b=u2Pmn1dliI30gG6gZj3gSr2NrpTRSnk8Eyukmp7uHJVSRgb67MGyxxO1LRSjFc42KF2f
	 UNGvqxDhid/CkUVUxDCmasXCy18Q2IJhVaXyo8sqzZlsuuzYkWq2Ntnxve982HYpt8mfu
	 55VbGlZFTU+jPACV95FdzS69Rm132QeAyHKTklpRIaaygdKdC9Gn/nFY23gnwzOcJAjWN
	 LTmT024uYDoU2/Ot8r182lezar+lY7zfbRmirzAI0jpaEFo8j0ayFmlFsXxdBZrvHx3QU
	 1MEwIDsGdKpM2JPIRgRDizTUEQcvymiw/gY91U/De4yJ7/Iky0iiqUGNdjFI4AUqnqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795198556;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/aYy+s/KRZIq323Dv2pV+TO8xuoaCDDygN3hOZPspyg=;
	b=XrtP0LhaPZSbVSmjB/hRktRU+3MRNDaL0aenDaGqWlYS/oaEKwWsJnWMd+TwKoyS3OyD
	 VeAyZMb1d1B/17grop67Q3qwZRKNXRb2SKUnFUniS/msOsXo+RFvn4UcPqljdJtUtIMK4
	 Kpg8CYkJQIikK+heCCqpFmo29x4MrsBBP5ae1lnWb2mta2HWbG9ZDkENx/YBaPbHZS3Bk
	 ID9Jf9mKsTLgjMx1lSwSC2BVgpBIWFDb1vlzL7HX1mLXTQrQtJxhWSAm7VSEb9g+bH5vN
	 GFAfEiCB8NcmDSakSITyaslABTubs/uRF4c4+NW0QV9aFIpsrKN4hGg3nNd/4s3Uvdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HCHY6Pgt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hzZZca8q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE0D606CD14
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 18:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FE0D606CD14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HCHY6Pgt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hzZZca8q
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKEfSnJ048811
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 18:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/aYy+s/KRZIq323Dv2pV+TO8xuoaCDDygN3hOZPspyg=; b=HCHY6PgtN7TQ15NN
	qqXZ5XLfkttIdPF4meb/nUcA3O6ZVvcWOCI+FoKPmDQdWYLzxdwc/8TR+Zy2GQtJ
	63LvLogaOX9ejWraHSmNiqbvqbWpQWcKoOKZMGfi/phfWNtue5Z4a6AfHaGi2J70
	27PtpqA1rrjCWOv0BRWAh5ntS/OWzuNlWZ4slZs1mCtbX1xQQgZUuM8ho/NJlLjw
	gM/NecWrmdfyJXaZRH1n2kP10tL3PQpuqX/2+50Zgu029SC+vJcSDcyswLh/dS2k
	nWdDzXrLfXqhTVpN6FkOS+TgRUHfcBmUk4b7el+506qpVrlI/0Z3kw2xJJXcC/Su
	ZzXC1w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2mm4hvww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 18:15:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdb869327e7so1090078a12.0
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 10:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795198552; x=1795803352; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/aYy+s/KRZIq323Dv2pV+TO8xuoaCDDygN3hOZPspyg=;
        b=hzZZca8qfaTVP26nL5czFhx+o4S4J25aqjIwjoTrDUabMIE3DjPuy4utun1DKHoU4S
         kCdp2QOlLs0eHoS4V5hid1WefUwyTfKcOA+PhTJnn2nHWq+5nIyKaptFGgL/jscuwiU8
         72sI3cxNoJQHskWmuUjKIDlZuD/umFrGjgfLzeIi1RKHHgpAP5tK4yMK7SsOtXJmmT8W
         OM0741+vYd3ppPrmxE3ABQspVJiR91OAswTIL+TP7QMlWUFBnBPFu2oIs312PsUtcfxD
         q4xLGyMX05NN1xX/yabwvKjHg9Ibg7FwPWoQUd7av15CbKGhqnZYmKudWLtXAkAjW2+e
         RYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795198552; x=1795803352;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/aYy+s/KRZIq323Dv2pV+TO8xuoaCDDygN3hOZPspyg=;
        b=IzyfQT+/Y+aSE0GRFNbp7A7yDA98ZbcUF/BI7AFlGKBWACjcaQijsvqlDwhvSFN4hT
         VmMyU8odn/3Lm8Q+KOnQnyIGAIkqs6310qb22Dirt8ATM1x3Xvwv3mVuU+ntldSs0BBl
         yP9POssW4dFGCFpVnKAmxGTMnaVSNT77Q3YbzVVrNkL3u+vYALlJK6g5P76bGv73UW6j
         PoyC172hRbaPTDCOOrgTpFJN5pu6R2nUSleUEHteDx+9ATh0Ag1y8lf4LBhtckbDaLUf
         tsQ+DDGLzKcqFlcIT4bcEB7wwVUsVrsQ0CyiEN6cGsv4YqJrXRrxYEqKPxCtI53MBC4f
         DQzA==
X-Forwarded-Encrypted: i=1; AL+hErF4oaddoyHZYO6wNLbl0p4ZOu2gP5852bPd2DOZbcIka3GZZwwFD5uy6JiQWPA9uHtG9SZRVL0ixetekSuoMw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9W6c25R4I1FaBoHpR8OINn8roOMSWtARlEEfBui9iZS0Gaut6f
	AEKiY8uhVmdI6DNBSFGeQ5k8dk+/2Bkpj8Hwd1K19bqywQSGKLaMDYhsFQYLSceN5gKw+rD0LFN
	lEo+8PZKoWrN+HFNEDJNpl2wyGnsCqi4ndxqojHi5lYwrqK+ibOS/C58lmQuzUZqhTPWyiNjYW6
	PHdw==
X-Gm-Gg: AZFdTZePOyeji5w/MxlhwFpqrmFGlXCymzSfjB2zzG5HWep4vRf5nNuJfcI+T8Z5jHv
	I52G21v9VnAt8XkDM4SXBPoCs0UKbC1jHFdcW0nW0fURCf3ul//0ps1oR+MxNmrFk39zNq/NxgN
	foEsPUwdGEtxzZo6S9cb8Qm6h6wOvnTvb+Ymz5e78cGSzg17XCNARWdsY2MnvVpWd/CektjQtVB
	wvxCEv0E7bPLVmyUhBLlNIpemnxm94iO3sHCXUjSbC6cF8ZN/U5AgFSWJsmCOvQv4jWyjLMOH+j
	UEcZ0i7Eo2F5hoDwP4fYbPqXPEbu/LsctBnjI7zRKxg3ktPL362Eud3Jr6mCzTxETUqSh1WJVl0
	IoMySNbuR2xSWvcAbRgmm40837u1rAwhhHbOQvudy5P4oK0mb6O5TLdYvW6pSIGMPpI5SVGwJJb
	Cfb/RCwWMAC4aI3vwxhjjHJw8Myg2E
X-Received: by 2002:a17:90b:3c11:b0:3ac:8fff:5a1b with SMTP id 98e67ed59e1d1-3b41c905970mr3863695a91.34.1795198552358;
        Fri, 20 Nov 2026 10:15:52 -0800 (PST)
X-Received: by 2002:a17:90b:3c11:b0:3ac:8fff:5a1b with SMTP id 98e67ed59e1d1-3b41c905970mr3863666a91.34.1795198551678;
        Fri, 20 Nov 2026 10:15:51 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d135e9sm8253246a91.4.2026.11.20.10.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 10:15:51 -0800 (PST)
Message-ID: <27c11c6d-2348-4e0e-9725-5d4fab9591b0@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 10:15:49 -0800
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
Subject: Re: [PATCH wireless-next] MAINTAINERS: mark purelifi pflxlc driver
 orphan
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes.berg@intel.com>
References: <20261119144833.306182-2-johannes@sipsolutions.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261119144833.306182-2-johannes@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OGLKFD6qfqm6HsZsWkHXOLpGwb2CMp0M
X-Authority-Analysis: v=2.4 cv=RZYFmFtv c=1 sm=1 tr=0 ts=6b008e59 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=_EeEMxcBAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=KdJDY7bbZyA9z1u2U70A:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3MiBTYWx0ZWRfX3NlpkLeuiYli
 ttY2E6rKULjbLmyA3Haigedf5Hj1POS/fwmQrw4e0+aJB9khaRD0hAGLyq0DLKYKhA92Oc2hipN
 HfLyvF3PHpdLE4Urhq6zAgP3GPfDmiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3MiBTYWx0ZWRfX5uRGfV5KjdMT
 L6EvmCGCs8dPzhoaOlK73kRV5Pgy+Wnsq71tG+s+fRW7RhtL21YGd43R4eFRFEmvFn/QdEowqIZ
 XLdS6rfj8qGfrySxqjmOJpmJdJyJiAk1zYB5L6G2KJatgYVRnLZiLeJqfkCj30H8ZpBC3vAbb7P
 pk6ftz6IAzVEbq6jCkcinJ/dqFg9tBkKcVNdX7koNb580cNgJ8YX0Sd7Y4h9X+gqOzG41X0Yhed
 uqHCOpx4M4LOmRBrgiU+YUQBXiKc6YWZdxx/bdz0nt+m08lzYMVE4j6qsq0Tf3J8r9DNnSQYWWo
 O8GWOVxnJR6cdjjWrCQ+arBAS8HQRn5JYQ3BaxI/V9ojk7EmzpNsy2XuVQMAYFiKjVBSiK5+FvJ
 cztMW/xTJ5a7g7cMGqEXMckI3HeCkLz0ux/Hv5zkGeqDyVqOiFgkF6YmGpv5q6nts1kI2mfP2ZV
 NE3d51Jv/eTGx7CWqmw==
X-Proofpoint-GUID: OGLKFD6qfqm6HsZsWkHXOLpGwb2CMp0M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200072

On 11/19/2026 6:48 AM, Johannes Berg wrote:
> From: Johannes Berg <johannes.berg@intel.com>
> 
> The maintainer's address bounces:
> 
>   550 5.4.1 Recipient address rejected: Access denied.
>   For more information see https://aka.ms/EXOSmtpErrors
> 
> Which according to that link means:
> 
>   The recipient's address doesn't exist.
> 
> Since I don't have any other contact, mark the driver
> as orphaned.
> 
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>

Reviewed-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

