Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132019;
	b=sc3E29ZlYM4rknOAlj/Ff9cFVjkO43ITaMaPZlnbS/VrkymV0KI9Acvda22FKjzgemeG
	 bubOPTiC8Gs5GYexqZO0TAFlpe4uuCraxyOlJMiXWxPo4w8FrK61348P5AjLO4Xq/rJtc
	 jgFQ/uwqaTeNo/bp+qCXTGCjvE2T8vOnLmq4EzBAn/nMcKiT8MQsv4yv5B5vBkgibv/bj
	 qgQTKN+Ub+Trj6LpSLvRVoWzpK2XJwB3AMLm+JAk2mghtW5OL34Sl3GVKRmuB1Y762ieL
	 vIN5Ca6x5tP4XYgAl+C+htSKt4sAIe4rvlY7NrBwbxaU5yFMXJZazDnu86jyJXM/feg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132019;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:To:
	 Cc:Subject:Message-Id:Date:From:X-QCInternal:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ywdLYv7XjTS09LFKQvuVk3pTXGox0hEDPrVdY2rJ4es=;
	b=FQIiV+wZiaDZvma/o6SpeQNPUYjPql+LwusUAW+FohfknyIm3tM9RyisrWEdpmcxf30h
	 tQaDSQZjL54pIRDMidtJvlQDVCGhdwDVL1A05ocec0Rgurb9eDihw21nK9Ek0DuEJ3d5f
	 588SIWMcORlzEXTlufZ3+0IjwfSpeAl3ZApunQwjih0GCiVmFhJTzaB3cy/8E6dTpQwyf
	 S3o4x8ecZAzwSR3sz+PG/4jKPfIkQmOhMtNYZLpkbrgFS1eprG3Tjdg7UoF7N+/yQ7H9u
	 R7FAGyAP3VfiXEikQClo7p6yO83kwEQNSi9ulAFCj/XC735g88rpTsGtlIziN9ch+HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DCigIwcL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E775606A325
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 23:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E775606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DCigIwcL
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJJ1egS095767;
	Thu, 19 Nov 2026 23:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=ywdLYv7XjTS0
	9LFKQvuVk3pTXGox0hEDPrVdY2rJ4es=; b=DCigIwcLfGfRI6IZXPBogW4JDxTu
	lu2nUbmc9xqZT5BFQv4J/530jAK+95zmblqPkiYJz9tFSwUDA64rY2K6Nl7kUgAT
	4dT8+QUSyfehx/aJoilCscVHMrSrOQ06pEJ1MguwSrt8TfuVGHfsx3WKo6SZByu6
	ZHXrqBl3QdP51O/BlghO06/fjzdFCUJvX8s1PnNG+P+24Jd5xgZUeHifoRkNPTWG
	ofOWqyjv3/+rVEIpt0SNi8DxV31Sq3csIFfC0362twuslLSrEZYOjZPWunCU9iS7
	tyrHZZctmsezBeKssCzElrTWe7N3m34rKL+vOX2Svr8reAx/622yVfZH6w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xx1bsh7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 23:46:53 +0000 (GMT)
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-jjohnson-lv.qualcomm.com [10.81.91.45])
	by NALASPPMTA03.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTPS id 6AJNkq5W1934784
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 23:46:52 GMT
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 61434)
	id 56AC524BAE; Thu, 19 Nov 2026 15:46:52 -0800 (PST)
To: neil.armstrong@linaro.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [net] wifi: ath12k: properly set single_chip_mlo_supp to true in ath12k_core_alloc()
Message-Id: <20261119234652.56AC524BAE@hu-devc-lv-u24-a.qualcomm.com>
Date: Thu, 19 Nov 2026 15:46:52 -0800 (PST)
From: Jeff Johnson <jjohnson@qualcomm.com>
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=PcBqFShd c=1 sm=1 tr=0 ts=6aff8a6d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=u5w7P5qLusBq6V5lPPMA:9
X-Proofpoint-ORIG-GUID: HYr4riAcr3207GssDV1TSDq4CJH_mp2S
X-Proofpoint-GUID: HYr4riAcr3207GssDV1TSDq4CJH_mp2S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA5NSBTYWx0ZWRfX+mB6W4+1ZfOm
 kPFLqs9a13vfdU5HSV3rd0SfQZA8/ZDbQQA57SIETcwhbaHlM3e3ECfynjq//aLxic1Rr/oJtXa
 xn9KvWR83ADnf5zLVclApDk7zEVcI1p80bRWTypQlXv4lNqP0B2AwWrMHFhDaRUkx397z4Ahruy
 jm7kfmk+RZR1Ts8ZWlDZQnv7ziAyuaF23Qm9/eew6n3tyzWhah207Th4i8icSA2gbeILHRSZ9Ar
 /QKwBCJeH/7rTNWkec29TrqdVD4FSHojQlEOxRNklvabwJpYEM2fI/7Y9ibVVelAIgbKLGlFOQp
 Oj/+3a14B+EW9Jj/AkOu37U+eYKHtgX26LdR+mm79EM9kknJpP4YihDEo0e8kCFgvcS+pnsOmsC
 Xt8nMKb1p1UUXeboYlsWEdB7gy+vCIgWWFde1ymajzzQFO7IyEXFPZtMSwK7Lh0jz5bpmIMPpi3
 Bb9YDbtWFJRB4J1pJGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA5NSBTYWx0ZWRfX7nh6IQOIFQIw
 SSKSUF/eEZkWSy7dBQGGrubRbkoRnJu9o3YHxRtSmRghW/hFhvRo3/Tjt9Ex5n0nZ/NTpcTbjpu
 wVKlwMdPObUSA16w8/zzoS4gxPImBeQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190095
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list

This is an automated message.

I am cleaning up my patchwork backlog, and this ancient patch does not
apply on top of the current main branch of ath.git. If you still wish for
this to be considered, please submit a new version of the patch, rebased on
the current main branch.

/jeff
