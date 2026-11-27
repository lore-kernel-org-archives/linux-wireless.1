Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749833;
	b=TkGSFuFDCNV6sA/p/073rwgi2QNxCQJ5QxlyBK+CAZ+UnYxMasQRTSoOOzskklKhhwNZ
	 dOc1KbcHUI1chu5pGoUyUweP4jMK5bBdO1pYdtb6kEJPTkhbw8owUHO5A0m9/mgU4vIOX
	 Ub3dFxY8Piu5q5Xshh5d2Ir7H3L22lXMboh01DfWyoVzljTga+NjnzUkzBfoCSWEv4Vx8
	 6t13J5JgZopo3TBTjmZeFnoRSDl0tAhIavQpV4vk1x3fLwcsj4kLBUxrBVobdq2Ye1lwK
	 82u1w+ViWdKQ96fhjct3Clq6V6G9YYIgAAQEDjBcfPypTRZH6caV0HJRlGY8+b7/AXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749833;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TJ4xoalTzE2Xjb5rHQibqvoB9yyeqtzIVvR+AjlMcL8=;
	b=0NqpZYz+ruvU6ADKC5AmA8N1p0iVZihF8OHpXo7i0PcDeWhUChdgUnSxbc734kAdr6Vw
	 qPXK5dpOR9KHE8iRIoyCXddYk4J2uPPncwpQ+Ol3KnCxwHMYU9zk88gEMM1CWyD6iX5oE
	 oUI53lDiztVVZpxjbrZkdJAbPN7anYId+F6FQ8F7XTG7oH4FHCan8z7k6Hg8Cx3jvRJL3
	 xlPIuAr0bOZVc6VgsmICb5EGrYccktpdrFLyW5agAllSD+qBaS7sinUC+HfEJ/KvUkZV/
	 6I8tQJJ8hODNct+CVF/aAgUbRwHcydC5kd9VAwEliswTUb5yBIfujmRAoA5ukai2myw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=koATYJk3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KMBat1iL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46A3606A31E
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 03:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C46A3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=koATYJk3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KMBat1iL
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJw8Yu781864
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 03:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TJ4xoalTzE2Xjb5rHQibqvoB9yyeqtzIVvR+AjlMcL8=; b=koATYJk3/rX/ewj7
	qWLcpwItkqMWctzdXuZ54RuwEHZV9Bgzn0dujW3acefewzngXypbV4VsO9vlwZ05
	zfZnQOp5PpxhZc2++zZXd5hDa+tx7Skwz552Nl4jfsLAae7+hhW2Hl9fX+kXAP5I
	JkNiuDbRsnpGUo4BOEhI39qbOVJFc9Jm9jpmUVf+9nrIMS+qgYVY2rT0lMKyindX
	7ObMCOz2fC3p/WhXYWacVRHQRduszajivkxNVWLq8QRJlTc68enyPC4tIr7hfJJu
	U/HnXgRRtLoobI0b8qSf8sLTYbVs5hrXXIdyokJ7Zb26Ddr3fKAysIm3knhLM8KS
	P7U83A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm833ey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 03:23:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso6394271a91.3
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 19:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795749830; x=1796354630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJ4xoalTzE2Xjb5rHQibqvoB9yyeqtzIVvR+AjlMcL8=;
        b=KMBat1iLwL6I7BPHgoNYnUh/+K44elA5xti1K/LjK8dmqGmXvlynT+77a332Ut0zNE
         1wtoREq41Fqh0NBdSjEx+n4CL0eWTXlody1I1eLzsSvbPr0A2Z0gPE1B+lc4ON36d9bl
         zx/1hlD5QkxERaXqGpm6naZNzE9RpqPleAKEFdQwQiyp6CXWOjfF02T3LE7UOJ2bwh6e
         AeeQkN/5bHZC50gMk2Zt6reSYXKBuRdAb4aLiQXWE+sGdF/Op8k31q4ik47T+GwokLJT
         36yv453MzzkMLatM/i7yCi5RGE7Pz5qR9HuVbI1UL0sN9Uy86ihuO4/HSm9rsvUn8zpC
         MTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795749830; x=1796354630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJ4xoalTzE2Xjb5rHQibqvoB9yyeqtzIVvR+AjlMcL8=;
        b=t4G3PkY6I67AqAN/vIayAjSlnewJJ3Y+wyTgZWqKj0frVjA2F0hT2OGx7LbYBD/I9a
         0kBbW9Bx4YWG6EW8b7ubz4Qhh9vK3skZdZI1DfiHSY4Z784p76BVMsD8kwXU3rsCRvxT
         QWOO3MZza1yPInlk2ZkaMcdPugX7qsNeWS6tStzOSQ1h78Of3zlzaWwX/1HLrI0gJ1DE
         6nQNFy66ihQFrze1FTL4LaGISWkXcDxe93MOVGsjzzPm0SUufqX4V+6kpnGoyAIF8J2N
         e93dcO4JW6PXD7G85LPZUOQ5kaANw5I27VMC4B/TTuYbRkxeaOCDX/g6dl5uPAnGLw7S
         7w0w==
X-Forwarded-Encrypted: i=1; AL+hErEMyUf2yy4QinSkpC3/h3OWftPZB3j1hninTZwB4nY1lQBMf3oTnY65P0s+8BVKiCfIWa2zSQUfVwHtaDYkMw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ff9EPo48hMLuqoOBgvq0JSvMAbg+3aVTukqiVcLO5Lhgv2m05
	pQG7uB+bzAUjLdLyKMRxPVyPJ78XDvn0ai42JaRCJjvPuJdAvsZtBQ5bZhacdQtNapz9PJBdDyJ
	OajLtvOZ63vzC7zJuFyL0y3+Z5VFAgBbPMy+9EGby+ZPitUD90i2f7qpFOO1uHxu4UO1u3qLNyW
	plFWNl
X-Gm-Gg: AZFdTZfaRxCuk9t7uLTjM77TysUaYixZMLMmeZyUIyZMiQunlnq0TB4gsa5FoE7rzDK
	u5wYnhUWJxith3nN1Wzc2ClgqMZxZ8EGjyP1HNPrFylut0zF1XEJINqyW60qXZsHC3+6SLB8MJs
	Vg8KZPeuQpkLilvbrRPNge0N0rBTZBWBdQMyzP1odxko5aDb/nRRxp1vnV7/6BiwuzkBhAR9lpx
	lA2IA1SoyR1AqEzHuVEsPsoQI5Tmn+gdtBUAuAN+D88SpTTBKA+ZmTjv6ojQcTWWakPGrI6wIuk
	M8Yxp9MwCa6EFxxGU3F5ijGChy8nJHf1HqiTulIYhzsWGz7v5tdtzBcYJ7GvssAzazU4vWFoLSx
	MXgakEMeJeTJVEzumffq7cOMJWXEXFf1NWDS0i/xxVB0eHZPkUkF4cAgon314xxg20UZQc1OTPl
	84EhrglOZQbJIDvD3zSz8aID8QM56QKPc2qXayp88NRQ==
X-Received: by 2002:a17:90a:e70c:b0:3b0:d551:ab2 with SMTP id 98e67ed59e1d1-3b41c955b0emr21947674a91.51.1795749830460;
        Thu, 26 Nov 2026 19:23:50 -0800 (PST)
X-Received: by 2002:a17:90a:e70c:b0:3b0:d551:ab2 with SMTP id 98e67ed59e1d1-3b41c955b0emr21947647a91.51.1795749829999;
        Thu, 26 Nov 2026 19:23:49 -0800 (PST)
Received: from [10.133.33.167] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm38187020a91.11.2026.11.26.19.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 19:23:49 -0800 (PST)
Message-ID: <b25a7fa6-de52-4543-829c-b4e1b8cad56d@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 11:23:46 +0800
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
Subject: Re: [PATCH ath-next v4 01/10] wifi: ath10k: fix SDIO aux workqueue
 starvation in recovery detection
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
 <20261120-recovery-v4-v4-1-53d6a04490e0@oss.qualcomm.com>
 <5e83a95f-72fc-4a5c-877a-9238f76df192@oss.qualcomm.com>
 <CAFEp6-2b48rEz5ozY8C5YGH_mWJQov1X64S=M=Fv2c+WCWHM=A@mail.gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2b48rEz5ozY8C5YGH_mWJQov1X64S=M=Fv2c+WCWHM=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3A3wF9wfBYLtfqUqhIKNarbvLRGpWc7Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAxMyBTYWx0ZWRfX43+hMZG3Wgy1
 1uk0mkGTLE5XucB/H0o8cjH67BicQz633hfrbOHIl/4PwNtEROS5aAuRiTqroZrzuz4pKibQSL4
 0V+YFSaFA0w43kpqxsvKgxZU3LeL39g=
X-Proofpoint-GUID: 3A3wF9wfBYLtfqUqhIKNarbvLRGpWc7Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAxMyBTYWx0ZWRfX41Z/UgDsKIFc
 xIC9qlIU+1KQ43QUNQChXL54NufJiVJe6o7kQMK7CQPkQPypDO72pi41kXHBU1ScqKXiE487gfD
 yGsN8CCzYw8zM3rhzDXOe1eck/qzt0ZLHvGNl1WfsM542Xvw/k+RMY+R6SZJq2DS210D8YQSJkm
 a0u3cAgkurxlj3usZIz1bLjbfYnx3e5SUyaSF0yrW7njnSpeATOUR5H0TpLMyiyHrshO3NoGbe5
 +vDiI41QUX7LVfP7lg0n2sseuTdPM3sjNzqHh0QZhaW2Fq1lTFrpZ/9VapHP+BLJ6JJygy2c6jb
 ChNmTsC8NWQ0JgRLp0uaj4QxIAK80KZyS5Oj2hodgpz01C9eDpUP7WDh/3U5hDgz1NOIqJfckXv
 peykfs0hk+lIMBZTvJM+mUGiYx7fQ4B0/RxbGzyvRJTmZTTkrcn8OPhmjtVubfeHdpXw7jKuatJ
 +WkcGhkhUjMy7/cKhbA==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b08f7c7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=IQv86u3dUjXOA_Ac820A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270013



On 11/27/2026 12:01 AM, Loic Poulain wrote:
> On Thu, Nov 26, 2026 at 9:16 AM Baochen Qiang
> <baochen.qiang@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 11/20/2026 4:41 PM, Kang Yang wrote:
>>
>>> @@ -8170,9 +8177,13 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
>>>                ar->state = ATH10K_STATE_ON;
>>>                ieee80211_wake_queues(ar->hw);
>>>
>>> +             /* Cancel the deadline monitor first so it cannot declare the
>>> +              * device wedged after recovery has completed.
>>> +              */
>>> +             cancel_delayed_work_sync(&ar->recovery_check_work);
>>
>> If recovery monitor runs between "state = ON" and the cancel. It then wedges a device that
>> has just recovered. The sync cancel only waits for it to finish, after which
>> pending_recovery is cleared while the state stays WEDGED.
>>
>> would be better to move cancel_delayed_work_sync() and the pending_recovery reset in front
>> of the `ar->state == ATH10K_STATE_RESTARTED` check? Then either the monitor has already
>> run and the check fails, or it is cancelled and can no longer race with the transition to ON.
> 
> Alternatively, disable_delayed_work_sync() could be used, but it needs
> to be balanced.

I need to use a fix that can porting to v5.10 kernel. 
disable_delayed_work_sync() is introduce after v6 kernel.



> 
>>
>>> +
>>>                /* Clear recovery state. */
>>>                complete(&ar->driver_recovery);
>>> -             atomic_set(&ar->fail_cont_count, 0);
>>>                atomic_set(&ar->pending_recovery, 0);
>>>
>>>                if (ar->hw_params.hw_restart_disconnect) {
>>>
>>

