Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582085;
	b=FheSaatJqJAcJjRIr5//kNJSTbjweTlAQ+ySwBWLTPnns+Tw0FGng8IRRFtL59w7adok
	 9o9nVXdDC56GlYZ7DP+WzS8Ce+wLBp6gibqUahnCbUSUOg/PtFZgIHPFrD6QaA1ADbKFq
	 VWlgwtGhBc6E/tpAFuC/237znK2Mkr9nPZMgbVTNbYxI27Uj/Rt2n/6nlkJs+8sNdOGaa
	 yXyODpUK6WQgWfe0o3DoQSnAGignCqLanjK1xw+yXTyLw95eB5I9LLeDYOjwLJlLkSTJm
	 k8KD2J+ylUuY1DmHcV5k+36QUy9xTujXGVCXVr6t+vpj8ItJnYyKsNedDteVaG4Z/Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582085;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Exs8Q30IzUVvqimeo/nqIxzGT3S6odHDS1qCj6yj8xs=;
	b=ckJMMFDDgiXiveFqLMPR3VAR/hRymZNuCNM2dOx329e2xT4cISGWAoq3TSAZP39tIxux
	 9dAl8mLUZ5ftBbIHaFs3DuScgzEfPZmQBnbPzJeBfCrXkdnJtdPyK19b/KdcEjI/e7VvB
	 A1Kil1q/2BBBi9o1egVh3o/LLrt4cXhgNeOvJOT7PBWuMl8s9Kf48yeuTxxzJIjaVNU6I
	 dZvnrkHYsNCGeuZ2o0YfDRcyfwsaq7Hi9oFFArlORG3Dn2ONvRFWhQR+BqeO0ENP+alk3
	 tdchZcF04wfvJXPBF/2EPPWYEm2EzJlnz/bjwJkxNkXpztaznq9MUSq4Hmd0i8y+UFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=db3BevUI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jugoe6Zh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDB4606A323
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 15:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCDB4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=db3BevUI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jugoe6Zh
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJos6516550
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 15:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Exs8Q30IzUVvqimeo/nqIxzGT3S6odHDS1qCj6yj8xs=; b=db3BevUIOLLkQ9OQ
	Gc4Z/l9fFkZGb0IEd8Opjde10tEha+oJaTFK74va4XH11WXGTCDj0bTq5y2BwhlH
	FtY0dW2nPSrxk4uU5KPi6usK+PUZu2vMfNwNtko5Oq3ysH/wptdJgrBMifGo+yiI
	t6zSth983eGis8ykBjrJ0FnV14UyV43ckDheMFvwogT+tfipKLllk3ZpbJTBsMY7
	FgfFyibwZNN4KO/ks7UJ6qosLVxWkE0AI/b2OqgZwWRJPzXlsQf/Gbl4aqHEhZQS
	JB+4cauaw/6t7TUrfLczwDWxgNomnfQLqm/hoSl+l9ReUAbdjtaROSvYvmO+qtwA
	JnxZPA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdknud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 15:01:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b852fdd55aso1559668b3a.0
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 07:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794582083; x=1795186883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Exs8Q30IzUVvqimeo/nqIxzGT3S6odHDS1qCj6yj8xs=;
        b=jugoe6ZhzvRj/W0kRV7tbr20zGWfyXao+fV42b1mDCvqkEN8XnbToCOzZezOK5NXvl
         K6++AI4GT+roXEtEDjmFX4az9UN+YOc+05ysRszUXR54lhGcgLa6MiVvNSzA6ew0cDn4
         a+mGm4uEP42IKWOHjyemILnx2Lok6pSc7N62Pnn1l6Psn759A2pCqZuCGdP4pNwlEHFn
         PmHYI3i6OMNVmpksUfHled+GVz7dPX9FEZAOCF2ZnNF+SRL7Tno3IZj4PDW2CPvZYpMZ
         Da5Q7yDuPXkVHI1XMHmRNvrV+EeKz55hvJfvHEpdooo0K68BsXBvkcWD5yj5oStv5i74
         X4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582083; x=1795186883;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Exs8Q30IzUVvqimeo/nqIxzGT3S6odHDS1qCj6yj8xs=;
        b=cRIcLN97hkd3PJyPZP9KjtINRDnk9VZEIwQ20FmC/p4QSvkCZkFpoYflvqRCHvg1QJ
         xtIdco3L49rMGl0RuqXPsPO0sGMKEuULutKMaA4AvNmR8601LvX+juSx7dU7XC2g6kqB
         5Z/f+xvCNS9ALuylSZlYloG2u+IApFXp4JP7/dUeoL9zim2uv2iInk1MU2YFJz30YbAP
         7FmU4ioiu1jhzD5huzHltlz6DF1s91eZLxePKWtykT7w5UQ9YiIFfwEz0MPkYELZYM3R
         +dR3h9fCRUBjpHfS1tvUdzDI9Sf5jRcD0WkrRHr183NqKmfd71JDnklKeYl19pcbCEWC
         pWEw==
X-Gm-Message-State: APuU4Z+LsvX87BszBD/WNrI4w1jKnILWr5Yl2PZWEwjwJwHFXCZ2zVtS
	esqju4B+O6LxC6HD7JyZ4aOjQHU12poqMGm9W+emsiWbPNyGJDXupKDofWK/GesQbwHu/VKh5UF
	Wgtj2azI1V10n7mh1+JMjEJNIMGNklZSQDOz3dCdo+/GlVEEnCK9gxd8LSXsxmFNwultwmg==
X-Gm-Gg: AYBFou3Ri2LUJmHFG/N2ZY2sQerMT1uYy74yMEfW8UWIsxmWu2kMtcbufq7mPFGtLuJ
	BSqu7LBP9nbfwVFCBXhgQfclcZTgJUq6Z8OQSUiOH7xCWcKLYyV/Z+/ZnXhH9m1vssMOxFTD4X8
	WoMzHOn+0PPbJKSdVq5S8QKEW3TEZ40C5BMWtfNk7eFGtPlDVze1hnTyBAy1lAD1+l8r0mRJyYa
	+SpxVWgTtTOrnRT5/8fUloTwmXhxP7IQWRKXX4fQDKeHoUNgQx8ENVFkCrNQNivpowqQRqOMfbf
	i10Y1veQGnFAy7DWypJVcBp4shRNNG1KYcSAlIwx5ZCFo0o3QkaHbkqu0lPvEA1b0fx0etKzv94
	YC0ssqx20vM4Oq6CkPRyxAMWETrfkil+nOoPZznIRtBy/JPEWQ9uSbHLdraTgZzvKb29UgSvA2K
	fq+Rg7qmXwjWSnWJHDjgnVH7+++J0=
X-Received: by 2002:a05:6a00:929c:b0:89f:1b32:29a5 with SMTP id d2e1a72fcca58-8beb20cec32mr2903306b3a.7.1794582082894;
        Fri, 13 Nov 2026 07:01:22 -0800 (PST)
X-Received: by 2002:a05:6a00:929c:b0:89f:1b32:29a5 with SMTP id d2e1a72fcca58-8beb20cec32mr2903266b3a.7.1794582082281;
        Fri, 13 Nov 2026 07:01:22 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed1e5ac38sm1229474b3a.31.2026.11.13.07.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:01:21 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        kernel test robot <lkp@intel.com>,
        Julia Lawall <julia.lawall@inria.fr>
In-Reply-To: <20261111-ath12k-coccicheck-mac-v1-1-6d8ac143ef05@oss.qualcomm.com>
References: <20261111-ath12k-coccicheck-mac-v1-1-6d8ac143ef05@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: use str_enable_disable() in
 mac.c
Message-Id: <179458208113.912426.6104563927231383217.b4-ty@b4>
Date: Fri, 13 Nov 2026 07:01:21 -0800
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1OSBTYWx0ZWRfX9QxCQA/3efk4
 YjopBRFif7Ds9pZFzEIU86o5Abq88F0XMyJzv+sn7NvDFbUtJr0tnzoNc1p4zyr4mop2WqQUPDx
 rE9DzbZONHMqK8KC0htnXlKPe+CZqKA=
X-Proofpoint-ORIG-GUID: NNKkvmJN0oBPPbIBbYI4rOsl7zrtfnwo
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af72643 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lzJ5LNNlOlyJiXIcJQYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1OSBTYWx0ZWRfX/LyM3hyVRWC4
 QGWF3FvNdMudWM8vvtQiJfp7tshQ7Crp3l6gzjglC5dGO8TwQyU2sVo72O4UcJTxTsACO5B7Fx9
 ckh1XJVbafpafLgNAJeUzMzJuCLV1rTMIVnKk7tE0+N/JsayU1naOKQcxrRdl34lsECbTb7TUgF
 k0u/kzylDEWVTn+qLVUIuBubMD7RlmX3wIg9A8jElOBPwUXtqBHb1jLbuIvOdlDMCCfdNo4BV20
 6X+d3NMbI9IjhucD6hiTiZmSKowCvFf22O+D/iWKAQrBuZb0MsucnBNJCW295d9t1S6n/7k+9Ov
 9f+Y1KkqmKOOFzlmMECbX2KHsrHjswgxaEIBzXRkixnVU785UgnkFCqpCgS531YA6Xeu7MO7Coy
 fVa5h+21wjab2RHBZKrw3oPvSMgZoRHOqBboyGLcJ+mNBUC6BqTc5MdfCZ65ESypIRNPtUc9+w/
 8MQjX3CF7eGmeEbP/lw==
X-Proofpoint-GUID: NNKkvmJN0oBPPbIBbYI4rOsl7zrtfnwo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130059


On Wed, 11 Nov 2026 08:22:06 -0800, Jeff Johnson wrote:
> "make coccicheck M=drivers/net/wireless/ath/ath12k" reports:
> 
> ./mac.c:4556:21-27: opportunity for str_enable_disable(psmode)
> 
> Update ath12k_mac_vif_setup_ps() to use the str_enable_disable() helper.
> 
> Compile tested only.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: use str_enable_disable() in mac.c
      commit: 1be6c8d3027d4a421dc46b93a89a196c61945614

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

