Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595143;
	b=TFWByqUhtmeCVy68vywmar5HdK92OT+e+ofN1Wq+/Uot7aBWL3L6hcpQz7d7njigCj+P
	 /ZYfB/PRyR2cJyLTvtAikMrVzYX8U/ZP4TXZI71hai5hqU3y8UHYOJt0fd3bB4qwFz3TE
	 JFAE0AtpFU3CfO9Rpncd2NYxfNQdTTS5k+8Y7vTbotkiNWwbw5hL2XuZEWiJwQO8YOPXt
	 ju/CMRz9Q3+127dlHreb4YyKfrFWAHhAVDEjF7dAsc9f+Qu0VQU7JOk8IaSbS6LlaDmT7
	 Pqn0wFqpoLndfar8mm4FuNHStZlkZPGzlXl/Lli/3kyKZSp+wG/jKYeyNUJTdfe3rgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595143;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=s7c8JL+q9Cbm7aNJEf8MDq8Yrx/mghovFmqSkIqYKJM=;
	b=T3Xja06WmV9MjowbKOp9f0438CAIlpB/hbM9K/+rT0G5cDrVlBEZlMSJ6rVNouJpwX2Y
	 p9WbuvABdPhJ/5MNyRaZ5GcPTvZUMYJhx8AqGP+8xKY+ywk5i/HxXtsGiBapToFwUdR4X
	 Mx+0nqwFJdaphd20VwvmiMU9jx4jIE8BvAT/LXansdVguGaM/lXXVLkwKFAEmD+HRKBc6
	 dJ9lRJTjc4TRqtlUwlAKIaeS25z7ABPX+r44gmsrKhaNW4H7aO+GAdCWDdVIyhEFOZDHC
	 Yym0aRKOkJMgfc/jgWOHVEMisKJF0p6dsmeNeHRi2DQeAUP2+HMlmjP9itI5teKUCFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=noOnX1MQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jICNGaWY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2CD6077DAF
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E2CD6077DAF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=noOnX1MQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jICNGaWY
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRhBc1725993
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s7c8JL+q9Cbm7aNJEf8MDq8Yrx/mghovFmqSkIqYKJM=; b=noOnX1MQVRia9Aj6
	N+ueNXJB+FcGxC8p/iBKe/96NLK3vje6NQvNs/bierFd9mM9F5TrlHtCnQxrnfmF
	8suVJwv/RKjVl6GzD/ijCABvJXE2S64+OMnoveHGQcfMVtW//wWnsudxibuIGOYn
	MJZ4tXcGsi+3MfgWSo9qF7naUcZu8r7S8uqYFmETTd8EBS5tHtEa//udcAjBLn+7
	SUnXtSDnJj9ZgB9uAdRunDHt2qGRCM1T0Jm1rlK6fIK1XDv+ZNHGzSKLdehVH/Jk
	R6Jfr1qIxyLjlQ9471+iG+CzF49qzame66TF7eHNGndhLwxCZryIwktmbdJeviim
	imHe5w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx1bp9mxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:39:02 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-37549877380so1617596eec.0
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794595141; x=1795199941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s7c8JL+q9Cbm7aNJEf8MDq8Yrx/mghovFmqSkIqYKJM=;
        b=jICNGaWYkqEfwqfrVD9C1lKkWIPeL85nnytLt+IfqpS1RqBeXwi7XTGu7tL/MvHnOR
         wiJwAWX8R4fIZHITrJO35jGRsE6FbUWjjMGjA3fs7D2wJmgJsVY0/Fc/SHPugJicMIlz
         OPDb8DEeTMYOxeJP7QtngosgQqbHbgQjqzB94HOC/xpIvH3BZpcwsV8kiB9QpOqfa1QQ
         lToBwwSls3zwwNgrFMRt9cJlPMwxnKnD9VgKESao7vzlvO0p+PqR8RskuR8tecPvWlC9
         fEnmPSH2GTFwawrdWLPle5xfbGct5tyjcF/0wf9lkoSQ2HhrusjEoK72p28ZasMLV3y7
         YKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595141; x=1795199941;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7c8JL+q9Cbm7aNJEf8MDq8Yrx/mghovFmqSkIqYKJM=;
        b=aJVyitc2BL1Mif5YRJI8U/OwOwNCOQuWXuJteJ4bqehcEs1kyJ+tStpxG3KyGzEmXZ
         Nfd51kfF2JI025mPtu/BgliFMiVJ/LJAp8ZqQ+0mmwFFTKmjgdmGk5kzjAIPpRpWqDfx
         VSOJQHr3JGAYHIXf2w73LXVC5a8+7bvTJaqd/Sf3jWHhqKVx9P0xufsK6iEjoClJVIc9
         aTsJfEwOq84vWNkykrjwIpb6PSKTF00vRS2voQipEJiLRR6SEZ4sHR/n/d5pzxFLFFbC
         2uutdeEWXMRKZdrLUA7oh9AqYXi9kDzC/TGiAlWPXWRt1tex+P8v5Fc9DkQiAMpMmDka
         ErtA==
X-Gm-Message-State: APuU4Z/CceEccFrSf7xu+pAooAKdLH7Kq/JlPmLJ8VIL5VWBnMdGObkH
	z9cfdMS86u990x9G9+Ay2EN21nIHEJjPdGK/64vIBBsgon9+5LhHNgMzOPnHSbTfC1RLQ1IopM8
	O+oUZIF/B53X5drAHJZchM1o1A+laoowbBJ2o4JBl5qpeBwkbACuuzqaIIY20YSbs314g
X-Gm-Gg: AYBFou0pwdZwfxxLCx05To+Ux6nQCzz0mGzekwleuvIKqhDCD8WeKKm07xMRyafdJSu
	MlVHnMVzIZCREmGEhBugKS0/WH4OASQGifs1RHZ7HFEY2a6uz51NvF9r3L6oeQKBGcglFQ/xAoz
	tK+XExvnZ51xPNMPEXU5HYcS9tsHZq/dkuD3G6fUX2mkYinrjNyj9KJLyPCY6DQ2MG/caFdApDP
	9/rE9rvEFZHIZMbjMkgCPwcMWsb4t8ct76TxuV58ckCePaJYPFGdwP4K83heh5Z+nKij2KZSqRG
	Xwm2vCp+GhOliisJyXr1uCb4BF5T/gWjpnfzohAMDdQRTYOfbGS0zofEbzXERCuhzY94m9hc3xm
	r/kUA5US9RNDLz9B71AtUvX26KTinJAiSnRvLCNJMbuukuPqpldYmKbVPAESMIPGPQwlaTAuo3L
	cV1kGXkbCoKDVLnepyLBuHelugcS9kJcd9AN3SAk4Xt63eXDpvlLBKgzcqCtRXF+iK+w==
X-Received: by 2002:a05:693c:83cf:20b0:36a:4a08:f0f0 with SMTP id 5a478bee46e88-379684b1ba3mr3617872eec.27.1794595141001;
        Fri, 13 Nov 2026 10:39:01 -0800 (PST)
X-Received: by 2002:a05:693c:83cf:20b0:36a:4a08:f0f0 with SMTP id 5a478bee46e88-379684b1ba3mr3617846eec.27.1794595140468;
        Fri, 13 Nov 2026 10:39:00 -0800 (PST)
Received: from [10.50.62.158] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm14046781eec.18.2026.11.13.10.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:38:59 -0800 (PST)
Message-ID: <91d1c974-5910-4053-8f4d-6bb54ee295ec@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 00:08:55 +0530
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
Subject: Re: [PATCH wireless-next v4 11/21] wifi: nl80211/cfg80211: define API
 to notify SMD Drain completion
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-11-62e39487f51a@oss.qualcomm.com>
 <4c5dc50b40bde5cd9221d318e44645d913268666.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <4c5dc50b40bde5cd9221d318e44645d913268666.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W9ytxhWk c=1 sm=1 tr=0 ts=6af75946 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=RKf9KYSdOsptWaLQyIwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 4t2kwMfPY7Kv5BveWaJB1PO2uC31tmhN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NCBTYWx0ZWRfXxT+VQtluGaYX
 OhLcoA9YxeE7q+qIr+GOepYIKtfGs+23L52E8HyX8Ufp2Q2fObQ+dcCwc5rTvY/ICI6l/+K8NiY
 ZFNaHe5KLERjcQxv4bEcvk/BT/uMrMc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NCBTYWx0ZWRfXzO/TqwHn3Gvu
 BESb/GPPuauklTKnJDw3BO8fY14dnwg+uOjBUGSNk37RPUzU8A+w+pY08gkGq40WZM8naDOXXR8
 zYFIj8AQ0JyG1da9uKUzz4QC1TwIv/7jNlJjbclYhmBqvODMFVbQ/nU2By2zHACYgLP0PejdrA+
 pOvhiSd9LUmQhl0iwhxuTApnrc4l8eN+XYGOkZiVN8GxVrgVaADneEMuWlRQEYODirjKqiJ7ena
 If7eeO9P+81TeQpJGm6yXIt0deoItXygryNrjLaoOYW6cWnzBZEIp6FD1GLjlfFEQx4EcSwesUm
 tkVmJFmDWZzInXaydY39g9p72HFGXe+poZ5MD9CgBaRSCmqEZSBdpNpOsb2vVew30iZVc03csLH
 t60oSAhc7OWbWQGuvw7/fJvJ3u0shHovV+8tCB30tnqua3YrdBXhRNfyVH9ZG7/5NRUIDKK2dVQ
 Xl7mE8VOMy1mv8jFuqw==
X-Proofpoint-ORIG-GUID: 4t2kwMfPY7Kv5BveWaJB1PO2uC31tmhN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130074



On 11/11/2026 12:31 am, Johannes Berg wrote:
> On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
>>
>> +/**
>> + * cfg80211_notify_smd_drain_completion - notify userspace about downlink drain
>> + *	early termination.
>> + * @wdev: wireless device corresponding to the AP MLD
>> + * @sta_addr: non-AP MLD address for which DL draining is being terminated
>> + *
>> + * Should be called under wiphy_lock.
> 
> "Should" doesn't really work here (it's either must or not), but anyway,
> why, it's completely unnecessary?!
> 

wdev/dev access in nl80211_notify_smd_drain_completion is not protected again
and it might race with a DELETE_INTERFACE. But I think instead of mandating
wiphy_lock here, would it be okay if I changed it to use the wiphy_work_queue
to post this event which provides safe access?

> johannes


