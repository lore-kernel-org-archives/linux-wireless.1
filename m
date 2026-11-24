Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530481;
	b=jqGhdp/dvGLYs4hWraOhK+tE8rLGWnAVgMbMVQflCaUTLbk0hb8jDg9kOma0ijATvnqP
	 SLewbqkGjUEGSfiSWfhYv82P6LJdM44n7dJLrmo6N63E1aV3xpab1hooQr7vmL8vWeUmF
	 WZ7n7V9Xu6uIHDKOULBVcFZxHbyOh2+Xfo1y1TIEdkE2kYkpJcrCR2fiioQTXDRkuvd0i
	 +hmdXW7T1mbN38Bn1u1JYUtnxH6CSZJbtw+7mdrPcnEtpBgqkaEJKmE4xZhcbAFXUJ75a
	 bmzfTx1lSGN0G3/Uapc/h54Kv779pI2VN0yTVcXo3XUJ8EKsAIwLx9fXiq4dKspArbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530481;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2e1f8mH50dVq3zUP41WlpUgQLkq7jx1cCFUDQDKor2E=;
	b=j1e2gJuBXGnLk7LR2D2xN7HU9LeWg427zTsJOB6CmJZZKqzdusNfZb21swSBYYznTR1C
	 2xllSp5IMq6TME/PrAkoD/oDS5cERZ3XEkT2xFyG2MbaE31IvC5NkvDt3Rz6+/e1D52BW
	 fMB5Iw4YcUF6ZJzxaE/nsgV8k2BA91bMva9Iyik+kuygutVClz7YgqqtA/W8G+6aqIOhr
	 lN2uJQ2lHuH608pAJPYqs1gGADvM76+He0i9fmUcb3dLbHvYb/LTap9DQL4Br2sAavOX/
	 JgIuwKiPQUN00HtBi2NjO5Wak6Gp0Ngp8I6xRt8UXiG0M2Ee0OHFxkqYVTUV6+stx2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ehHEymiP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PcmqU5zH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5CA606A331
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 14:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B5CA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ehHEymiP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PcmqU5zH
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuMCp3541873
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 14:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2e1f8mH50dVq3zUP41WlpUgQLkq7jx1cCFUDQDKor2E=; b=ehHEymiP2vHy9XnQ
	ME9obw6CtHFbeMT2Aw/3n6M3lSRaUO5J5xly4qxrWUub6qa6o/aDmymIFsNuD6rT
	644KKRGOjTuyAx+fISCxw5uJzuDgb3429BOIaPk5s8uvOdXZDPyIGf5v6I5yrSpS
	eG9gVyRdOpcHf/yHojuxyBpiDDGpjCk5RAvPmX2bWeNF/QXJQ2UH/KPhZ0stBiD8
	+Q/roXCceCYAKGJzSpktDc9qmshL8ojn/FiFneH7pSJax52Y4G01J7aA9SwOoIlG
	s4sH3UhufW4ODC3m8EcaIln+HSmK1V1JJPL6M8nKYx8fIf1NBfGrXRsu4TGJXOla
	Of08Xw==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rha6g5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 14:28:00 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6790b1d37e7so6814381d50.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 06:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530479; x=1796135279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2e1f8mH50dVq3zUP41WlpUgQLkq7jx1cCFUDQDKor2E=;
        b=PcmqU5zHSjvRIMQaNxl7yItDrLmz18KHkmTGRDNXxKz2QDcq/YwLiNuiIwFk6c7qly
         REZ6ldKYWxdRd4q1Oaq4+5qYxb/D7uS0fmLwVfDoa5aGzuQNttN2wcflolu79DE35VWT
         i274p/5JosmQFRv6Sh7E0aOwlBWOubsNfDTVOso15lXWHb6gCfD8m/KXdkEFQqU46ljj
         ydUSTtnuyEz/3fmNnAEHP4t618GIvSoSSXPs2m2+tede7nhT5uyZm4Jug7cWIFOKsCUK
         dYw0C9bYhLSEmipDV8u8CKuinuk2pHYnOgCt8nXx8EI4oS3kj3RwAw/BmjW8clqAlzm3
         jNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530479; x=1796135279;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2e1f8mH50dVq3zUP41WlpUgQLkq7jx1cCFUDQDKor2E=;
        b=UHTa5nAQUf2XbR9pcNj0Z+PSeD+ETKXUkQiE4UbpPAgg7Pudn5ypEarrr7U0YKDXAE
         11gA/PargWDcGlhRS83vKgRj2FRnsGfHpS/jIXddrry8vlw9yt4jqM7qW0FfgyABG59C
         /Z3JCsW70e6tSqw0Q/ggrCBwGPE/DSAE3QMg79JwyOYsZRO5LaQE7oTj6tLNn75Zi724
         xH8UZ0VvP1Ipsh51khzTJ3FabyyCcJ1VvMR77dXFIaV/mOtkwEUaWWJMEXvpRdUOs1AK
         9AOw3bX0xAiBzrdV3B/lujLWa6w9MdcW5Qrk6as93GlXzREXp+gxs5jklKUVIwIspFlu
         6YLg==
X-Forwarded-Encrypted: i=1; AL+hErGRqRe8xMQIC+fhjLewElUqMJ4UVfrTdlvhiof/JWeMV/xj5Dm6iYbq4tBRArmIHbGUcIkTUwDo8yVEbzVDbw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8eCFmByC0P0VWzbAsKObEmQXHUWZUjI6vGCApPf+1RImDWkfgR
	C/eoN2WM6QfN1s5pFiqi7fXa8zEbQ4dtmlIjHqbObGR1hJ+q6izDCMjaT5I7JK4cOQWfwAXA2cG
	jtb+EFICD3xzDN83I5QzK2nGg/nWam2IdNzzJLdriMAt2Uf2YdbzOjhW3GOVvhCgCSBtepw==
X-Gm-Gg: AZFdTZcU9mnxmqK0cKXMEp3f3suOWzZET5fNlui1u18m3zDrCLta40ekn1PCRpAjTQQ
	b1VoUEja8t32FX2oSRzGGsdpwVkaxWc7lWRPXPZz+WK4Zy7ycw5aa1YX5GD1YbTmZmpQb4g3ezC
	ptBL5RML+3Kl5tqlJzTQLtW9s6r+m4/GA3J9X5C+5G2Qo+hWpJwuvH60U7JRwFczNz9ofvkV5s6
	YGTFumORFgq2vVLrVib0kTzdBF+UOS/HlKefGJ67fxKohrOPbsz3ypYxGwqEQOdim5tDpSXfHm4
	YVRc4AsUD9wL4j2UMsqobJwKm1QOrLivYdNQTUlZcAiBIvYSwp8wzXrmJIMXlLyHOk0KIi6unyi
	8vZVzU0UV6oTEAEKmkkmPkjO6KKo7pgX/dpsore8+tADwPeRRNFjVEGmFmgi4jEN+phl9Kt4nRQ
	m1EaAMIsSsGZzekGE84zbS2nuA0O97PA658g==
X-Received: by 2002:a05:690e:801:10b0:67d:bbf9:11d4 with SMTP id 956f58d0204a3-67df44b7404mr4067700d50.78.1795530478708;
        Tue, 24 Nov 2026 06:27:58 -0800 (PST)
X-Received: by 2002:a05:690e:801:10b0:67d:bbf9:11d4 with SMTP id 956f58d0204a3-67df44b7404mr4067679d50.78.1795530478139;
        Tue, 24 Nov 2026 06:27:58 -0800 (PST)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33554b5sm7035521d50.13.2026.11.24.06.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 06:27:57 -0800 (PST)
Message-ID: <748d38da-fb00-4f76-9b58-87ad0fe9b770@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 06:27:53 -0800
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
 <f2f50403-fa42-4ee2-bb22-c78309590196@oss.qualcomm.com>
 <f513c601-ef8b-4524-9c56-d3d121c8df2a@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f513c601-ef8b-4524-9c56-d3d121c8df2a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b059ef0 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UQl-3I4BsUNNjRoNwgMA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX3Le/zJLHpbpK
 g/EpB4SLK3Yjne3L9VjpjNvVyClAJutO05KitZ/M4mnQeVhl0ze+qihlxFFYIQmj+JjFvZ+LH/F
 bFwLZW+7wYMTdKj9DZQ0KvARQtx9GKM=
X-Proofpoint-GUID: HPVZayjU1G1_DFVQVIR0s44Q-GaETT0z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX+iRgCGp+LorR
 fqkdfoHbTo4hW1ExgUAhF30kAyYVX8ay7g028cnOVlJwuhsaekg6vMeael9GTWEK8zd5qo3sGaG
 sBrNUJTuFQN8ohe8sxqJhFI8/2CwLR90INnnBYfqvUyFCevSjioStFQAW507HESRYavlJzXkJqZ
 bkwZbMXMCN8TB6wdRlXyshSIeaat/SKQwic3VryLNVQf68KfOHCmRxaMj9BtyT8Ffrk8OJnIOG5
 7TQJtAjbZJ8sSPDk1vMMM0cFRkC/s5mONBRXQcf3qRKbOsHgau4VDYLCoJjhgtsYK3XVfHUgRMH
 /SseMAYHC89oyK5GufJB5Z9KqUb1QpBSuBgs60eNBVmm03d7gKdwZNZBWaIdF40MAXDC4AKdQlA
 lMN4jTrNJZmgPjkGwHCsbeujpxJ6wHnxybOOT3HdVD4/3NvCHnJUYM5yVyCyLCT8oSE2dK8it8q
 17/gtAqJR8Z6ePeRNmg==
X-Proofpoint-ORIG-GUID: HPVZayjU1G1_DFVQVIR0s44Q-GaETT0z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056

On 11/23/2026 7:59 AM, Krzysztof Kozlowski wrote:
> On 23/11/2026 16:54, Jeff Johnson wrote:
>> Specifically for the DT issue, the original version of this series vetted
>> internally did have a patch to add the device in the PCI registration table,
>> but it was decided to drop it from this patchset when posting to public. We
>> can also drop the DT patch until the point the PCI registration comes.
> 
> Still does not explain why do we want bindings without users...
Concur, and I've asked him to drop the DT change until the series that
introduces the user.

/jeff
