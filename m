Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449265;
	b=efy2UamliMn0tHFUtzHoesVMQErMPretqr29HzMqGuuPb5zW82JdK4BSt36JPh3nNwmm
	 bAsbK9wDWZtGh0R3W8rfkZVQRa0hCv9D8bH56zjanxkZ3oeY3toKglbv6ZQDUzJ7e+r91
	 hv+BTWeXplKXCZ1Wg+WbLTuzHT3hNKDxrXeMLX+LOqILiMJ4MHJKXf91muCrNrs+dBDEm
	 HcjXLQQAqeqhoQj9qTjEYighBTT9ku+Vf9lT4pmbnvldQAF8bqIWTJ06zCZrlIkJJY/72
	 ZeaPVTLyDH/u1VmMHTJ+aUqJSSz3y2qeTRcdBzkfvF9KJKPNTQJAlzUMkFoMVepHCsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449265;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lU8Coo8wWZO2xm73msPjjDouSOiEjViRNz1SBuRFc0g=;
	b=BLsPB9NrtiPjyYjFAEfDPMJtbWdfMdIhHkL/wreOocNyAXFun2qYypBVILn5nF5BfgDZ
	 h3tCPv2y3MODaJGCQSg063Wa7K+YG2N1UGTamF/aD5D2jtmkfuRiEKc7SFbmuk+1nWGS5
	 oqebJIyxPFd1SqAlTbrR6Mm5vcGmitflITfcADM+vR5hJ+IWHbwoy8mTvY9PQei5Ban8J
	 yL1thBV11CdpL/TNo7bdJc2QLVP1XjnSwFow2ue8KnC6tpJWjt9XITgJ+FRlb/I/hNp0Y
	 0DtSX2sVGP244Nx7TVSnjuUf8NEHxGJ7JcwF1uB0FHq3UpyMDhaw2NKjDYrNJpoq4ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VR1fJlMt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GztqMX36;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F60606A31A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 15:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4F60606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VR1fJlMt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GztqMX36
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKt0D3329289
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 15:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lU8Coo8wWZO2xm73msPjjDouSOiEjViRNz1SBuRFc0g=; b=VR1fJlMt4WmeCj/9
	MGhs9jNJ4GGEbFs+HFKXU65iNmMWlrSiSCMdRLD/GJb3ZEEuxdWeQyoB+4jBvi4k
	sWcC0X5u+pdJ+Z4z2tkXXTQ93G0GQ5V8Pn2DI3/6AA8eXVOIakbVqcvDk4aczLsK
	S5BZ3GwKcpX9fi2JyR3SyamK19igcSpo1g276napf70pl2O91dMns5iB7vyfO6PQ
	HW/1Uhk/vQFwUOXiNcDislXDqaNlBMObGvWMRTgODOsAb/1NdVbn9Je0ViD6G1cD
	kBmpSaJ1SB+EbJu+8cmg1mJ6rDcZFbWxGQBgoUlRvxUWND3X+Gd+alTrM6YHbjFT
	A6INrg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd27d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 15:54:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-382af5cfc58so1187202eec.0
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 07:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795449263; x=1796054063; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lU8Coo8wWZO2xm73msPjjDouSOiEjViRNz1SBuRFc0g=;
        b=GztqMX36iNxB0SdYXm1AeFHaA4lG+B9p+C/LDAvzCXNDN4RVpAivsxTENP3zWI3iO8
         NX1BgKWemhCnDJF9txyK++cWLUrpMlxfAG3Uc8f8eA21tIm4y0BTaF8u3bMe+cflOJHN
         ht+S2Q8gbVPXsJ32Lsnj2jZQf8YlLsYeQtzNMHH2gqezEtJKpRWSNpzvLbY0dJvBvR/B
         xbZIwnjz485qi2TgyR3qfBVDRDLV0ebLcd9zW+h5e76b4A9gYYDVWEpXgPSpNCJeRU4v
         K++9FFQPUL9BvP41OgcIrjzBgKLiUIbkjusLi6nawa8txYjJZeNW7WF7igoujsvc9T4x
         7dJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449263; x=1796054063;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lU8Coo8wWZO2xm73msPjjDouSOiEjViRNz1SBuRFc0g=;
        b=g+0Rharn87LfPD3YvPMq07LuyTCbpnlR+gMkx70k6pm/OYr3U7lLT+oMQh4Fvw8I++
         v/nZXz/gEM7D6RvjPPQXkw3BvQ8pTjD30MkKfr1VyiAEmrsBL78kNMHoq2WeCy48GuTI
         nUhBBPNgIDcGkgYp5zAvNZ8WPQASJNmtEUbCuWY6a5kEnww041rLWDuoLrBLN5g6Xe3P
         +e5spJ50DVIY/2ZWGIEFkw4Nw/UWR33MzaYTY2KLtpqP0UbdetW76naM7rurg1E517cS
         mDDYLUMP8U79lqLF4aHBGbCw6876XOSFkb1LFw4vP1jjyWHTLdMx4mkkCamhMt8O0GUg
         4OdQ==
X-Forwarded-Encrypted: i=1; AL+hErEXxzd2N+hNrABPF6SZ4FI/2BPXUgTmPBAruXJIrMnYOpfkGWTnrstcMRs16bvzW6GW1Cr4adQeMm37SsetLA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/RtX6g1pEc6ujATRQtfq2TWYKb0i9CPh6gdXAkwKB3lzugxUJ+
	SSXJ48qtXAvu3AL/cXTxBc9+ShwxDAxtCAplAtCr04Puz35TPOsZsAMrA+jDC/DuSa5uzHZkzUc
	rikKd2d3NBziNlWb/vj2ScwPDsX8jX/3ppM621FiswSRS+3NYzSfRGKqLRrXSb9Rnwn4RFQ==
X-Gm-Gg: AZFdTZcDKYPhe30vIwZg6kdxsa5Qb2YtjVV8DY5p2nl+a/L/HCF161ovk9mf7dN3YkO
	cyN6//w22OGOIF5vXPF4Wr3ZuBapPclgC8aHw99KxWYtyMgV/vSp3opnVY9WrR/QdPpD6GKpQ1E
	ekfCGU/2Ta4+fjyN+fxcOVSyM7X1o3TTcrr4Gr7P2jhClRq7oJhMcJtNMm0MpozrqS2x2JwE+FY
	9PUWD5+BkTZll2FUK4TqNFao7++FjkQwluVmVB+YmkRcfiD/1AAhtAARME9ta9jLwtS2iemqcjC
	zYHrRAhFLClS6lOnWoLZApTtgQiSIEYbU+8MIFGe3BaVuvvaBzen5TM2r8+qqNfeps7gfpkeMaz
	5Dcw4umy9znPhHCgLUVbKNMYTF8OMr+8QEIWJEoa4HbjRp+YhzGjdOH88Em6bstH3OOOPvrxwws
	1RKHVfW5XZJolvAm7d5cu8Iqa6U8oS
X-Received: by 2002:a05:693c:805a:b0:376:a6d7:8f51 with SMTP id 5a478bee46e88-3856e63bbe9mr14886557eec.12.1795449263219;
        Mon, 23 Nov 2026 07:54:23 -0800 (PST)
X-Received: by 2002:a05:693c:805a:b0:376:a6d7:8f51 with SMTP id 5a478bee46e88-3856e63bbe9mr14886518eec.12.1795449262503;
        Mon, 23 Nov 2026 07:54:22 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm40628761eec.21.2026.11.23.07.54.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:54:21 -0800 (PST)
Message-ID: <f2f50403-fa42-4ee2-bb22-c78309590196@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 07:54:20 -0800
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
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v3 01/15] dt-bindings: net: wireless: add ath12k
 wifi device QCN9575
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v3-1-9875d2a3953f@oss.qualcomm.com>
 <20261121-lobster-of-unearthly-variation-e75ea9@quoll>
Content-Language: en-US
In-Reply-To: <20261121-lobster-of-unearthly-variation-e75ea9@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 03aHe0SJ_7aOBhVzt2ssq7d1KCZwKNzn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MyBTYWx0ZWRfX0XAYtx444fmr
 yHklB9x54AR1fFUjc2U9FaffuQ2NZw68xkj/+BjIySxyBOeGjDTfht96xvwGV5bGMaMPhND+68B
 5ElMeAWP8GbCvD1zIdZ1vBClhDCJplTcV8a78fVYUKsUYN4hn4waCk3V47058hqnFogc2+nH0kz
 AFDDJy6DJKUClrBc7pVxgCR233k6crWmMKZFEZLWEQw7TWndaTKRPwyW8UpJhtLE7+lsXhPbZEe
 w+2E8cylTKN2a15u4lL88dRk4yHCMSXMgZaD9mdekIBnWqvsxTUwXTHFWl36jz1cyKMhoXgZ8q9
 PuPYV/dioBHVSf9y7ZSYX5ye6T8Fa6SJZNIxpawajfatcPgopYmqrOlOwFn08yiJLiW3PAYnWtw
 +aNzAE9WqIL0MbTdrqHcHAY8vGkL069aTXJvMtFucM6cEIZYP8CWffaN0R36CDrTkC+FAZ+r0c7
 vS5V69Uh7ZYAQOE/jqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MyBTYWx0ZWRfX0HydxrLKTijW
 tSYEOzyF6SSdMrSAhRT33NC0DhaTkd/jII0JOFls7QMXybCQMXf2jpnm8J9KlQQU6g6dsxuFkiS
 DRaCCp0wxb3UDYKiqANCsxFpqOVTloM=
X-Proofpoint-GUID: 03aHe0SJ_7aOBhVzt2ssq7d1KCZwKNzn
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b0461b0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=wpf9FKuRYqRxeo0qB5YA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230063

On 11/21/2026 4:37 AM, Krzysztof Kozlowski wrote:
> On Wed, Nov 18, 2026 at 01:45:24PM +0530, Madhavan Ganesan wrote:
>> -  The ath12k devices (QCN9274) feature WSI support. WSI stands for
>> -  WLAN Serial Interface. It is used for the exchange of specific
>> +  Some ath12k devices (QCN9274 and QCN9575) feature WSI support. WSI stands
>> +  for WLAN Serial Interface. It is used for the exchange of specific
>>    control information across radios based on the doorbell mechanism.
>>    This WSI connection is essential to exchange control information
>>    among these devices.
>> @@ -48,6 +48,7 @@ properties:
>>    compatible:
>>      enum:
>>        - pci17cb,1109  # QCN9274
>> +      - pci17cb,1113  # QCN9575
> 
> I do not see any user of this (see submitting patches in DT directory
> for explanation).

For this and the other patches you had comments on, the cover letter describes
the approach being taken. What the cover letter is missing is the scope: The
QCN9575 device support plus all of the Wi-Fi 8 functionality is roughly 160
patches which have been split into 23 reviewable patchsets with 40K+ LOC. This
is just the first patchset in the series.

This is similar to the approach taken when refactoring the original ath12k
driver to create the wifi7 folder and wifi generation abstraction. That
refactoring was also done as a series of small patchset due to the large
number of code changes (102 patches, 20K+ LOC). This was requested by members
of the community who wanted to digest the code at a reviewable rate.

One key difference in the wifi8 approach is that for the wifi7 refactor we
used a separate branch, ath12k-ng, but for wifi8 we want to directly submit to
ath-next. The reason the development team wanted to take this approach is to
avoid the pain that was encountered where there was a "big bang" merge of the
ath12k-ng feature branch with the ath-next branch at the very end of the
development cycle which resulted in a large number of merge conflicts with
parallel development and bug fixing. Some of those conflicts were
unfortunately not initially resolved correctly, leading to instability in the
driver. The hope is that introducing the feature directly into the ath-next
branch in an ongoing manner will avoid those issues since each subject matter
expert will need to resolve their individual conflicts as their pieces land.

As ath12k maintainer, this approach to incrementally introduce the pieces
directly into ath-next, but only enabling them at the end, seems like a better
approach than the ath12k-ng approach.

Specifically for the DT issue, the original version of this series vetted
internally did have a patch to add the device in the PCI registration table,
but it was decided to drop it from this patchset when posting to public. We
can also drop the DT patch until the point the PCI registration comes.

/jeff
