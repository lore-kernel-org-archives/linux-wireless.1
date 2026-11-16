Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794806206;
	b=hb44YtxtGSY1xxeNQ/YYhuaD7qgHYKzUcrSgpibkaIEGupVuZCIxkDn1Fs3lSXw+qTNW
	 mdo4T3+S679vmMCFTXntLeQWW7cQSKjQnJmk17R3pnuDk2Z9zH51UITGE/eMSW/eh3acR
	 Gi8mXk0VrULrx9Z8nDr6c8sb07S+MNMKAoAt0YwZNYw4g2Kr0i1W6M0he6pl+RyI/Sgqn
	 TMrtRJQhOSDtQWc5CHNjhzbFkhnCSDlytgeD2cAn2Hty2GEu+dOm5QQJYHs2JnTGPcPnh
	 F2v5Wo9iN95Y/X5MyP920hladuPU/uS6ldUziQ1qtNgJ7JxWu/RYul8nCmFwC1kbCaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806206;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iE0mHKgasYDQXqOjSQmcbbi3SGf+QqcYTFBYQBjetIY=;
	b=r9iyOGhNu6m+Kjd5mQz+45H+k2N1V71aXfQdajwgLpeJMSu05Qvvoao4ydnPPyva1bxm
	 3rMs1GG2uz32F4s3p3uzd+eYrJqR1rnnuub9cJwtA+tE8K83BfGIN8m9sIokLgShIPhgA
	 JpK4NWbQB46eLZ6PmG0ZcWtk1w7rLWarFPvZ4YA/iv1dUCg+YJFqfDD8Ze12VCSqrvfJA
	 eXiAscMjrvZHVEFoZuMzTEfafCvB8IxWSiMAihKeJEAuy5IY3ELat41DuSJyDGJURtkYi
	 LfVthiyO+Bq2rtxcvxXUEyKd8v/IH7+zbR7KsRQAC2LvgkirqwGhCQxvduJHHthJ+jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GHGTUjCN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="U/qj8me7";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A00D606A323
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 05:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A00D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GHGTUjCN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U/qj8me7
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG4R6eD535909
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 05:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iE0mHKgasYDQXqOjSQmcbbi3SGf+QqcYTFBYQBjetIY=; b=GHGTUjCNVF6XFXEp
	q4Tjn64ueYx904I8v7i2aGnmzhhBDWIvc7gHlTh7HZ3TaSTmAaLzdsDqGrIkRve3
	4uI3XjZ9O99lIiF0CpqsTkA/4IAMDnBlX7BQO8RzYcyrhj1cAaSDHyY2hs2cMK8S
	wr9aVGvmuNdDD6wRcGRv81z2l+lKwUPmpdDQDY5JpEnf7jiAQ7IvRh9r+s1nLdEP
	fnnI7rVKRxyX/zzStPeNr/8edzBGayqFlrqQXL9S2gD8KdYaKDKTMcCYZMPQfiMh
	8d0ZC8rqkG4a36M3Hxba3Cif22G0wJqdXDHOxETDlE3w+qh4nHQV8YvAHaslEIK1
	g5F1Rg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhk24vmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 05:16:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cddc4bde4adso1323414a12.2
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 21:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794806204; x=1795411004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iE0mHKgasYDQXqOjSQmcbbi3SGf+QqcYTFBYQBjetIY=;
        b=U/qj8me7CTXWXpnQx2XYcwMZXmkIxH7ejgzAogcwNRNdqloAXa6AM+gsNCTzYk8GRw
         E5is3HgI3NM+mTU/9LbOscRS+eyVSexmxtn0E741vz0063Lz8vQb/Wre1z/8j9wiQKMC
         85rUoVZwMEYY4LH/rWON9zQaOKCssonH/OTtXg8/5QeSbJpMqSmUWqMak3qS8Zqr+y4U
         Rt8lF8BLPjInsyuncPb84gwA4E39T1vd3DigBnxjV8GS5AuyZBEDfCHswQsyj9A8Y6jO
         X8P07OFvEb3HiuRmgBjbpjGkSQHiTBeF5C+SEVbbgOH4zUkyyhsC7DWvSHFTkramRYtY
         mFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794806204; x=1795411004;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iE0mHKgasYDQXqOjSQmcbbi3SGf+QqcYTFBYQBjetIY=;
        b=Dl1Is7TCGIIM845cp1GwzCnA2eklXA/TgjixMqy9TvfZ9tibkSYzTiHD2oVsEMWNwf
         xZzGE51aQc9nXBqjO6mm4yrdLC/S4Z9A8my88OtxjwQ+g+HHt7Fg1L1fENr3Bujjd2vC
         9gybcxDRbTZdrrF9U5xEGdaAp7B0zyHanRTE0NMDjsUHtDR6YGpk7BN8+hXU5x1da76K
         4GyTI0uPy7PLEXCn5OlWe9xoXghnyeA2PgtgTgRZ9fi3NzROOeVWAKwiP9XWeO+i4z/V
         F0f66Ya+IkqS2z8GJw5C/v6oHSdOIKvqw+EY4GuDMsolF9Dhmu6H6kX8xHQ7lzDC7FmB
         caZQ==
X-Gm-Message-State: APuU4Z+xTt+bX2V9x+Xd7S9mg1iK/3u7I87MsLjO9gQmcDXV9W6O0znc
	AsDPdz3ObaL9zLTwbf+yeOOfRbqOXQBpxzpkl5sGA6pFQaWD7vy7gQoOAAIF1othntLXJBcCity
	g/wL65RA/sWnoK/avLaYfEGZc62PiAM1nL4Zo6rXWYJy2NWHvECzBM+mCb+U/lTpVYk13mQ==
X-Gm-Gg: AYBFou3xHqDflkQCVOzys+5BLOpJwcYp5KznumvypD9gpdXmJYApjKSFeW4/V0hzOdv
	LF+f/z5UXWvFUs+TcBnIcYrp5Ky8sj7z1eTEnXEa3+O4V/imP5A3QGXojCpaVYI4+cgNTITKq3B
	SCw+3XDSUXbNm+Jwn8wN7WAousf1P/MRwjALNXEBk/nC5qktFbjJ3i2/bxaHdjCorxhT6m1/Y5A
	/IdlduRQN3b8FjlsTpKMbl9cD4fQlvTD/qyL1LwbnSLLHGAMapeiaMbORa9Sii7X+NznYfj7/uZ
	QKCUY3bratQmOOT9WmhmjOs8juQKxBvSm03kFEV6uQzJMyJPwWFJFFiR6xWEfce2+k6k49HjsxP
	dHbet2uEriSFrQaKyRWv8ynlOI61/KTCaCCcnbmOEBIyAmLVRAJNeaYBsNexdH6ogF2PXKnisHt
	F6tAkM34GWTfrMor8l/58rykBEcbhmEFcTzLvsCKvgNH4fSQ==
X-Received: by 2002:a17:90b:3146:b0:3a0:e4ce:31fd with SMTP id 98e67ed59e1d1-3b1b0a42b59mr9391064a91.10.1794806203888;
        Sun, 15 Nov 2026 21:16:43 -0800 (PST)
X-Received: by 2002:a17:90b:3146:b0:3a0:e4ce:31fd with SMTP id 98e67ed59e1d1-3b1b0a42b59mr9391051a91.10.1794806203367;
        Sun, 15 Nov 2026 21:16:43 -0800 (PST)
Received: from [10.133.33.65] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec43699sm14582152a91.10.2026.11.15.21.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 21:16:42 -0800 (PST)
Message-ID: <8afb80bf-5f96-4a1a-b1cc-09f6ea77d939@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 13:16:39 +0800
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
Subject: Re: ath11k: WCN6855 on Lenovo (17aa:9309) uses generic regdb, 5 GHz
 passive-only
To: alexiscalin <alexiscalin@protonmail.com>,
        "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mark Pearson <mpearson-lenovo@squebb.ca>
References: <uiDP3AfIPxylorMgOmrrT94taa0jYfo5VPw94l4YkKyGPD0X7byxDKdEF4LFqv6ltBlbS2atFSQT7PgJORjH30HU8wOK4uS3DhyacPPuT9k=@protonmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <uiDP3AfIPxylorMgOmrrT94taa0jYfo5VPw94l4YkKyGPD0X7byxDKdEF4LFqv6ltBlbS2atFSQT7PgJORjH30HU8wOK4uS3DhyacPPuT9k=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WY4ns_CU1nMG5B55IcyrTFZrDRB3skiu
X-Authority-Analysis: v=2.4 cv=QanzLcbv c=1 sm=1 tr=0 ts=6afa91bc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=JeqzCeE8Fiu7eYIaxEEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyMCBTYWx0ZWRfX10u6mCn8Z99z
 mXvhFmHt915OC8HlZQ4IG9Pv0zXNd/ANHaZrQ0ewxBY69CNhE3k/mrz9m1pZLww4SporKyzLMVp
 w9D+3WqxE7n/3K6DQVXwoWjFfUjpCIL69zU4nGSseMYipvUsYrTpaWjHuQm6Q+6aHQVbYa2EuXk
 eSGshz/0LJzcTUJcfXGrvsj4HdBtZIg8C8VAeBJ2LVmwilP9yyDHt1cYuW/gF2HFA1JIwUlZWqt
 Orp4OvNa7VuuaPv4hl6uHehceig6AT2EP3lWG6uSQ02eRMsyUH4Obh6bqWJh8q4uSDbS9ha4RvZ
 ifeAYuLkFzVh5wuWiM2eCcvxmA4O8ENKg4rGFAuG4d3ffDrzPWJcWb/iK31lbTkIxwJYPp6k7vk
 Wt/Vu40PkwuEeQM+L76Blx3YdNRTTyiIqkbuuHIlTjiHeoJOrN5whDtpc7A+Oc0URW8lwPDlvGM
 xODw3KY6uQZafMJqFVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyMCBTYWx0ZWRfXxpWOzWKxmR4f
 /KlUGbdCEaAurqEhM0p7deiPPmI6o6EMwBDxBEMZh3eCBGOwu0XXBlk++ki9WE4/gIOkWgCJLBH
 cezkj4OBu3o7VlQ/Kyo4ecdUMfMODdo=
X-Proofpoint-GUID: WY4ns_CU1nMG5B55IcyrTFZrDRB3skiu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160020



On 11/15/2026 9:16 PM, alexiscalin wrote:
> Hardware: ThinkPad P14s Gen 5 AMD (21ME), Qualcomm QCNFA765 / WCN6855
> hw2.1 [17cb:1103], subsystem 17aa:9309, chip_id 0x12, board_id 0xff.
> Firmware: WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> board-2.bin: atheros-firmware-20261019 (Fedora 44)
> Kernel: 7.2.13 (ath11k identical to v7.2.13)
> 
> ath11k finds the board data for the Lenovo variant (SMBIOS type 0xf8
> "LE"):
> 
>   boot found board data for 'bus=pci,vendor=17cb,device=1103,
>   subsystem-vendor=17aa,subsystem-device=9309,qmi-chip-id=18,
>   qmi-board-id=255,variant=LE'
> 
> but there is no regdb for it, so it falls back to the generic one:
> 
>   boot failed to fetch regdb data for bus=pci,vendor=17cb,device=1103,
>   subsystem-vendor=17aa,subsystem-device=9309,qmi-chip-id=18,
>   qmi-board-id=255,variant=LE from ath11k/WCN6855/hw2.1/board-2.bin
>   boot found match regdb data for name 'bus=pci'
> 
> board-2.bin has 16 board entries for Lenovo (subsystem-device 9308,
> 9309, 930a and e0be) but no Lenovo regdb entry. Its 35 regdb entries are
> the generic 'bus=pci' one and 34 for HP (subsystem-vendor 105b).
> 
> With the generic regdb, the firmware's default country is BR, and every
> 5 GHz rule it reports has REGULATORY_CHAN_NO_IR (FLAGS 2), also after
> 11d has switched the country to US or FR:
> 
>   wmi cc_ext BR dfs 0 ...
>   wmi reg rule 1: (5170 - 5330 @ 160) (0, 20) (FLAGS 2)
>   wmi reg rule 2: (5490 - 5730 @ 160) (0, 20) (FLAGS 2)
>   wmi reg rule 3: (5735 - 5895 @ 160) (0, 20) (FLAGS 2)
> 
> So all 28 5 GHz channels are scanned passively, including the non-DFS
> ones. For FR, wireless-regdb (iw reg get, global) has no NO-IR on these
> ranges, but the device reports:
> 
>   global: (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
>           (5725 - 5875 @ 80), (N/A, 13), (N/A)
>   phy:    (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>           (5735 - 5855 @ 80), (N/A, 14), (N/A), AUTO-BW, PASSIVE-SCAN
> 
> A full scan takes about 5 s, of which the 28 passive 5 GHz channels at a
> 150 ms dwell time account for about 4.2 s. This delays every connection
> that needs a scan, e.g., Wi-Fi after resume: with NetworkManager, Wi-Fi
> is back 6.6-7.7 s after the wake-up alarm. For comparison, an Intel 8265
> laptop measured the same way takes 5.4-5.5 s. (An additional scan done
> by wpa_supplicant after resume, which made it 12.6-12.7 s, is a separate
> wpa_supplicant issue and has been reported on the hostap list:
> "wpa_supplicant: Initialize is_6ghz_enabled when adding an interface".)
> 
> Could a regdb for the Lenovo WCN6855 variants be added to board-2.bin,
> as was done for HP? I can test a candidate file on this machine.
> 

likely same to [1], which, sadly, still has not got resolved. I will ask firmware team to
speed up.

[1]
https://lore.kernel.org/ath11k/CALOnm7APGpVWcx45O78fa4hOCUGDc0-ywGoqicr51YtpxNueLg@mail.gmail.com/
