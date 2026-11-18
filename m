Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795031878;
	b=kZRv0Ve7KGK6mz6hc3AVu536vR0U5tsJMegk30rCdHblcCO/C/CW2i/MvXihy6PoQffu
	 QDpsyRALXy3dalh4TgDVY+PV6cwfxGLO56uGEJe4gp2g9b5reM+RNhlZSf/XgZwD5UEWM
	 lXNK4YNqnmQpKlkP1Yig6ep8LEGvE7D676CNzG1M+VGuD4JfOV3hkCBr3my0ygADgR7aM
	 eMxL4ZiBGte1srcybSI7Er9OsrG0VX5vei4xJYxbOOfGRsb2ojzN/LUr//wUZTxcr41UR
	 Z++Aml//NSFwQndUqevLTiL+WfhxK8GucN8zqr3NsShbq0sA1rokckhGkO0EvZnNK8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031878;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yjZG3lTJHYBD7QgUA45mnjS8BMmHSjGcypsug9zDpRk=;
	b=SoWhd+rPo77JRg6HPSvxT41+MF17qCHZmnY/Sn1dgAM3Lf9WNjAC7Fycul491hsvOSeb
	 M5VKrL7NsnOFAk1csUvgewFhnHqlowau0cGOhNe1FoVrMf0vEacg6x7QzZ/WMZsxOGKSF
	 Z1KdrJ04sDOQhbxAYchMIVzGbhNBHTARnS5quARXwXHr85OvA755ajwPBufcsiWJzLVTX
	 xgiSdR5rkxFWlXCVQDJ74oOxBts1mkKF+hQkN0iP7GiAVyXwUL6n+MPBx1zDRwA7y6Hew
	 NAo8cnmm5lxQUxNLNjZAJM4sWOOhoamJeWKXwjmdmC2HqIKWI7RcSOTaO2COjkgep2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EcNTSF9i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ew3E22N3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBEF606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 19:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEBEF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EcNTSF9i;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ew3E22N3
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIJP0I42132366
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 19:57:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yjZG3lTJHYBD7QgUA45mnjS8BMmHSjGcypsug9zDpRk=; b=EcNTSF9i2krMzv+F
	gShir+KeEzFFuiKEFVHV//KvBMp2eZ1P046HmDIk0pGXGEnXXaH4ImrrDT2Xvmng
	q5H+01UAj26RLeuK9b89hZeqtM/ckq4e9pcv43CWnL4DfwSfQzSij9QQoTNKUBiP
	gqXiNxo4uY1cH899WIKtN+zAZ294HIF5JAFGcWhfBOdPnx59xFj4MNnNXZ0QLNb8
	wJFEw/cFyvoaVEa8nuTc1AvlerzjHA5RI0rPpzkpJmuhUuVrPla7oDFFqp53GCBC
	D1Dg3ofcdYVwQd06LPJOXI8DR4m92/wnkJPM69+Mp/PPsIneEUuZIPDX0oOfVvVF
	M3jAJA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dnrskvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 19:57:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3817a0ffd5eso120571eec.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 11:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795031875; x=1795636675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yjZG3lTJHYBD7QgUA45mnjS8BMmHSjGcypsug9zDpRk=;
        b=ew3E22N3Es0ee4hB9T89WKaJaH2/AWXWHrUa+f/jkEyRD6PEcfj5pC1ZbVBNKZljpv
         h87ZNEYNL7eTW8JdQo6f/nVwGyAUk6RxI9jFcyknqU5dSyHd8ppDVqhJwhETpzFfuj7/
         HyaNhuKl8AAuuhS13FLijMJpUm+rT5YArlreil2vZNDb7gsLO8++8oB7izeWJNe1p3f/
         3khXEeAR9ycv8D3Ue53y+x+AZnWsybYDnP83XLYyXuVQQXmk5BuR4wUPvq9fDYlXVxmw
         +eXZZqO0ITYmtWpaEU8oxKEQrTTihDhv5c1kjJDgY0nldp09NJieST4/8LpU4Q9V/vLx
         RxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795031875; x=1795636675;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yjZG3lTJHYBD7QgUA45mnjS8BMmHSjGcypsug9zDpRk=;
        b=0QFtaM7arMRZGueslFJ8lh1weERL34XZJY2GPR1FmdSP/6ZUwiRvIaTTPcPFnxJkFq
         pf3XjJekX6KvWSqVaeRJCMZPQ561FfTghJ+jS6pKpJ81isPrpnJRJaFYQekyfKQIKSey
         QrOp9ZaBwwo5M76Uo9CiIILfzwmhnNXA7EnJPrFT0soSMRvMliOKsGSwg7NIoZR17VY5
         L2dYmSYQ1vmspjWkvYuBysSpPEZQSedTl72hTdIjZCzJZGC3i3BxGehaWynhl825ZMEZ
         Qgc6YG4aIegv2IS4cSFupwBf/ovKSWwu4cTAjK8/y86O+Bkw5LNZFu5jxDdCPVJa8wjA
         a8Mw==
X-Forwarded-Encrypted: i=1; AL+hErHc03w/hv3K5xZmk8orZqZ57pZGL2BW4Gi4xJk1bXbhKHcnNpWNwmxGoY/kZ9Mx0j2C7/jIUbofIFnlVVSiNA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Z80LAQjmfsRDeUhIYMOSezpF+kU8wvvkaoPpH0m/map0nXFjD
	VRdIoqumr+pzivjj2Nzs3jeFwQ+V0H8DLsFfuAgUyDrdJ+fHqsYq2KS/FPSA3R50BjGtSJcYBi8
	kVERAviKNqGqR2ZP3SJ/P6lSHSzRoZwMqVSV27LKvN/X+mjgKPL/0xqGJVT3Hil02jJVzl0gau5
	xbcw==
X-Gm-Gg: AYBFou22FfTusiER8SDIM8wEAA5oR9dTWt36Aq6CA1MA6WbuwISjEBT/3FliLWZLGnf
	XmywzOTTxZ+ozzTV9/EUCzkVuyz62/aM+X94smPy47HRl5aWat/IfO5G2NhOB3CehyWxgZm07yw
	jLmQ0OPKQ+tGU9MiwTPTByP5ULUdk0oEugbkOoJ4bSJnhUplLV2WJLVqjF5tL+Vvzd/E5oIIM3L
	XY5fQHeL7xeNhq7FdXSRYLSfwEVfPMOxB1cgJtOvqSJfOCfg5XKDQc7iPYyvfa1KwKJSV3ALXWU
	tOIR0Wbz/wfhw8EwYQcBGniFBjbm4XAO0098mIVlIsB529LPC/nLbeGzhbpVqdViujb1mr9qhce
	tbVDtZM5k0DY2MdFbi9TCDy0zlMmTfgdpmbMsxI3Dxt3yo4ymWbUhsplmJQkMR2g8mguBrIguxL
	KthDimDugEvrmOqBzHczB0GZmIIYqAttr5
X-Received: by 2002:a05:7022:5f0c:b0:1b5:31ed:e23b with SMTP id a92af1059eb24-1b54ca9c6a8mr369124c88.6.1795031875214;
        Wed, 18 Nov 2026 11:57:55 -0800 (PST)
X-Received: by 2002:a05:7022:5f0c:b0:1b5:31ed:e23b with SMTP id a92af1059eb24-1b54ca9c6a8mr369106c88.6.1795031874520;
        Wed, 18 Nov 2026 11:57:54 -0800 (PST)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5445eb29esm8807761c88.0.2026.11.18.11.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 11:57:54 -0800 (PST)
Message-ID: <9b13a6c0-1ff9-4c63-b1fc-9ab6def252bd@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:57:53 -0800
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
Subject: Re: [PATCH ath-next] wifi: ath10k: spread the PCI copy engine
 interrupts over the CPUs
To: Julius Bairaktaris <julius@bairaktaris.de>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <20261101164247.258200-1-julius@bairaktaris.de>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261101164247.258200-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX71GGf0pYvtYI
 afLF+2hVjCXZ/9uTsZQ6NL3+ixeV1x+/JHIWA+LQ6d9WcAxbw6mAXYqtYS74p/OzC9nwzLc6fZE
 D5dQV/YPwgHvn9h7tVGo358DDZpCGigu5hPo5vyanZ+QUw/zHVN01v51CcL2y1JJvg+W103g8X5
 Q/h3K5FUvq1I95iBC+/ZyPtJkraI7EvGyh2hWya2crK7ct/iAfcFQWDOJfy2FkvvETvxzwGzOzK
 ujYkKWcC0ilGZQ9bnYn5uk1fQktfDCAgLRtiZJZmNyllrSJSeUaqjVDvu8AwUOmkqq2grc2bkQy
 ddFv6jditK5l4I7meGAoBt7aZSFiyJk7R8Jo1hFwiA5ZCFBzYZWbaxF1q3KPoROdIMll9OVUFhn
 IB0rp3RvMmWytIm3lpHQRFUUVK5yjvN8G+zhTumBwtwm4R+rp5h8YUUze38pb8Z+VxvZ2E4eeKb
 k0ImcrucEzHMpoqr++Q==
X-Proofpoint-GUID: 8OWyhSPp5Z7e8j0LaUCTWQApGLNVMv67
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfXy1ECxoBx3KxA
 8NGIfufndr2ENAkJSwUKMJ3h3LWIbY1kAZ7CKLDh2Xee5RDKi/BQ6NNO4ikZ3JP6DukpQvVWtCf
 AOHw3ScvjdgKWWcFKCItGVlN9l9ac88=
X-Proofpoint-ORIG-GUID: 8OWyhSPp5Z7e8j0LaUCTWQApGLNVMv67
X-Authority-Analysis: v=2.4 cv=bfH+w+PB c=1 sm=1 tr=0 ts=6afe0344 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=83aLgFwHvIm-plu-MQsA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180077

On 11/1/2026 8:42 AM, Julius Bairaktaris wrote:
> The PCI ath10k devices are capable of multiple MSI. The QCA9889 of a
> Xiaomi AX3600 advertises 8 vectors in its MSI capability (Multiple
> Message Capable 3) and, when granted all of them, raises the firmware
> interrupt and each copy engine on its own vector, the layout ath10k
> used until commit cfe9011a05a8 ("ath10k: remove MSI range support").
> Since then ath10k asks for one vector, so all its copy engine
> interrupts and the NAPI they schedule run on one CPU.
> 
> Ask for as many MSI vectors as the device offers and spread them over
> the CPUs, starting each further device on the next CPU. Every vector
> keeps the shared handler, which schedules the NAPI that services all
> copy engines, so the copy engine to vector mapping does not matter for
> correctness. With one vector nothing changes.
> 
> On the AX3600, with a station uploading 87-88 Mbit/s over the QCA9889,
> the HTT copy engine raised 36891-37590 interrupts in 14 s on vector 6
> and the WMI and HTC ones 165-313 each on vectors 2-4. The receive
> softirq moved from CPU0 (21-25%) to CPU2 (21-35%), with CPU0 at 1-3%.
> Measured with idle-priority spinners, the CPU time of the whole system
> stayed within the run-to-run spread: 25-42% of four CPUs against 22-34%
> uploading, 14-35% against 10-37% downloading (3 runs each). A firmware
> crash forced through debugfs recovered as without the change.
> 
> Tested-on: QCA9887 hw1.0 PCI 10.2.4-1.0-00047
> 
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>

I'm concerned that you are taking an approach to benefit routers which can
actually harm mobile clients (which want to minimize the number of CPU cores
in use to reduce power consumption). I'm very hesitant to consider a series
for upstream that could be detrimental to mobile devices.

This looks like something that should stay within OpenWrt, which is focused on
the AP, and not come upstream where we have to treat mobile devices nicely.

/jeff

