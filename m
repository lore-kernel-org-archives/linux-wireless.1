Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293294;
	b=kfqUw5tfpCzSvUeyjfhjSpgLm44mIFJEihOY0Iy0mOJmLk3MKNbuaQMZdTzsfKFjJC4r
	 fgCSueG6+ebiAU6IYMfk+7axvoMba0XeRdMpbJD1nM6IEHJzItbZCts1+t9sKWcCsa2qZ
	 LisslmMkLsuUmqJ/EmydR+uiSO86hfbElWdubUz5zT9m6p0IXtMdS6tEH8p/PvTrZuf55
	 iubsgCxXWsf7peni9T1iRaJK9cu583g93dBwQsShjCNCnNLqpWtHeVhHc3ChRM97xa5ez
	 WTB496pJocaX3REjaDkDBOHwu2ivpotxmnc3zvfbuPMNF7Cp3W66WbTpoJSAhaYCx8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293294;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yXiMNsXECj/alswWT9A/r/Bf4gvOkgp8WN0k2T6tTJQ=;
	b=FiCtPRlrRwupY0eqOX6u1jtVJuQZORk4IkMvycZSZSjAdxQalnmSOwWEc1BxPqWE2ofo
	 /959fLimw6Tm52aDq6d/65DWtfQfyIw0ssYqLQisE1GbMsZSJrB+mAaqH9cWLlHox3jqV
	 rSwrCn0rsuaMvpilyeCQQsYNsAFCly4X3LYm6EYQ20jeck/vJLw7IIDEdjBUCbmYNDl1u
	 MdLRGr4kxfymOnC2BYwCyXC1ugiu/iWqGw3JZ49DoJkLmYawK3OwQEcqEyQzmZhMAXaF4
	 +ZrLSHxQXaJ+WPjf2NonbhOuFUO92kIwNwr5AEKnfS9y3gZ0WhFBI6S6e775HKl5N7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CP3QhQ37;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DH+Q4C6n;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C1B606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89C1B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CP3QhQ37;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DH+Q4C6n
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4AAsv2919666
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yXiMNsXECj/alswWT9A/r/Bf4gvOkgp8WN0k2T6tTJQ=; b=CP3QhQ37x5Xrb+sP
	lPt3qJrXr+QpFKnHmANaF5/RurWfUCEG5FZECaYeGIpXhPuJ3gVmDg3c7LfHEet/
	/eKtGabKXnn60ymzRxXAkCMgMvwo57YBdNX43ubMYmVJ/0cBpT6O44Wgk8ORUC4c
	RCFPP6ZH8Etos9Nh7BVuo9+YIWTgoqP6B5H6Jxmodfkk8Zx6KslyC9QUCPJ4fYn+
	b3bHL67ykSbF0vwawjwRpPosVlsADPihocfW/ZzIMwqi0RPeMqoQBacz95OH9Pht
	7/An4udiUmOsmqCPlsXKjewId8Yh0+nkQlnV+dtPfCx52KVd455RS5j6h3C60spg
	W+Xp3w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg25g3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:48:12 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a71dd190b0so6145662c88.1
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 22:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794293291; x=1794898091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yXiMNsXECj/alswWT9A/r/Bf4gvOkgp8WN0k2T6tTJQ=;
        b=DH+Q4C6ntO2kOZs/zcGlV2OhvZU29Jm9Ldz2xg5ZZlyd+J/ozaYsCaoFHzGKoFl035
         ztVzROljmQ7nLCkejcwWhJddbHQ5jSI++uluhPkbL0qUp1+cTuR54UcCLRf9kKvNzgZ0
         FEeAVWKPE9CZmmPbFt417fueLEwuKHK1a6OlMecc3XEn4vX949n4yWZ7SL7Cezi03H9I
         486BsNqBeDKzK+ZfSFor7nnLe1xdWdySGas8TDw39C13Uc7wSiHL8JLr6lgegDR9i7H9
         iJILz8sRq3daylkUtcpHhDWsmbuto5JIqWxgNF2zqXHN8P1R4u6LZkBx5Vv/IrhUWZcA
         Is1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794293291; x=1794898091;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yXiMNsXECj/alswWT9A/r/Bf4gvOkgp8WN0k2T6tTJQ=;
        b=GB93R8WrE7aQB7GeDwYSzkav3BEoVB3pQHst2KBp+0bpauc09sR5pGbV0LxLe3RbsD
         YCqTCLPVcK6+/ypvK8aWY12O+nrzq9Yd8h+rT1PCBbVVPqGvXm0Vw5T+rRPxrojpy/to
         qZHukIsRgdztY+8KJMptITsSGqUA2WmX2P5bHBgKnCFTVuE+/Wnw/Pa6rBH8IlM7SL8x
         9XtVPquAnBj3/LniYKwgpxO3+BJVheHEXeICulMb3bYMy9NKfIKt90ylXVB7uO2pCkus
         8pdentd/3TqlfL0gjqOYLiHFUMKgOqH+GqzjyI8m13ixqtPuEUfMtM27r4zi5WUc3uRu
         QLfA==
X-Gm-Message-State: APuU4Z+dgSeCChWEM098629PDBvISUAjnSBR/wpX1ch5qLF/oRZkd3D8
	PsTSYiXGm/TXGCtqpK1Flw06R7mmzARI9wG97eSRAo1+CS2G4DYTi1/a6BbsineXy66s3jBfzoJ
	RGtVhWrsDbLfPl/uHvap4lNR1zU0FJuzhvu2qvLyCBanEUrIR5G2b2fBwUtX4Gmd1qE+7qg==
X-Gm-Gg: AYBFou0qkSNUPHHmaxu2RmZelMYIxOy34EWQT7bj/XM4HJzbUEsiDklREi8LXr8bFOi
	X+u4vFN4Sh8Yd6InFv+HiGn2ITaa8bvY2QYMUMI9zrIuNTqmbGJ9glUuj5k/bJRS/K1uQ8EAPfd
	NvuFKmuZB3MYugt2YARANzMux3cXlum1m6bJuYK0/vEpstomF+WnakVRjjBJNFbN0pPqH+xayiX
	AEIMNIMJgHtDdJJawfITBTI/lr4jDYDPokIj3LjgKAvKxgMYYzGmfUwW8sTg1Z5QstTFhUBVFj1
	/S26dzEb879+vZOfgRxmpxN83TboUiMQhiygJHAD/wuj6P1/Yp9lKVHA6v0WpBkxWq3Jie+mU0i
	r34IfcNkhmv+Zr4WMYJ33TJ3wFXf+yN8PQBp0xdiCcRd1J1N5MR8sjiQ9ouT14yIekJSneFhzDS
	LNNQh8Dxv+7z935Q==
X-Received: by 2002:a05:7022:ef0c:b0:1b2:6d5b:36bc with SMTP id a92af1059eb24-1b3b6076f3emr2815097c88.23.1794293291101;
        Mon, 09 Nov 2026 22:48:11 -0800 (PST)
X-Received: by 2002:a05:7022:ef0c:b0:1b2:6d5b:36bc with SMTP id a92af1059eb24-1b3b6076f3emr2815055c88.23.1794293290377;
        Mon, 09 Nov 2026 22:48:10 -0800 (PST)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b72ce0sm5171425c88.18.2026.11.09.22.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 22:48:09 -0800 (PST)
Message-ID: <e59850d7-609e-44b8-b1fc-3227e6d0c191@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:18:05 +0530
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
Subject: Re: [PATCH ath-next v5 00/11] wifi: ath12k: resolve RX link id via
 logical link id on WCN7850/QCC2072
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX3aT6hBudllrh
 3AgP4x7qPeskBsQcUA2oEmn/TXI2SiDEVBNFY8tzBGy8LZe4U/3z7gTCRTrX1BhkmrWpp06imi2
 q9HZNybqix+CONBDvXuVo4d2eBCBgGuGzIF7KzGa2XpOKbZpdEWKAfJh9GEKL+8oWI/Q8Pw8k7J
 c0Xq6YSvQR9LQnXYevPABglw/2FgFV/nF/CEc6+L1E9yWA7lNF9RuMDF2UTcOVvGWrZKAA9mAI2
 BgfobMMNEfpM0/xa5q/hQrMAzIXQowtdHSYQihRTtZfaYFzTRUhUScWudYPkYSRn1/HGDHpgXJx
 7Eu3HhxtNOI6bHPqAvoVJAedOJ1RUicC+U5TRbCHPkUCff35mzXakc1d5TlAi4VT8CWGGzC5CHI
 sv51dJ5G9Q90aX4kJyU1ugujBqdqboXCkc6w/biuEgGOol9U+i4a9GJ2vLPu8ceRO+WYF75u1eA
 RqSF4DOM1iRjCTDFbBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX6ugY858lMSTm
 2qKucoK7GJeM1Kx8HoMkX127cWjh5uZnnyh5BuJWNbszA6Giphn0rXDedG8whbx8LCF+J25vgJw
 qkS8xQagdQ+TWLbbVSCDiGVItxQ9FME=
X-Proofpoint-GUID: McQwaerF4eEUH2dgKP688rmcsvMyvgyK
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af2be2c cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=p8EHsTY0Bp_m9RVOymgA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: McQwaerF4eEUH2dgKP688rmcsvMyvgyK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100026

On 11/10/2026 12:10 PM, Baochen Qiang wrote:
> ath12k currently relies on hardware link id to resolve the link peer. This
> works for QCN9274, IPQ5332 and IPQ5424 but breaks WCN7850/QCC2072 which use
> logical link id instead. Commit a2fe9dc70f3b ("wifi: ath12k: Fix low MLO RX
> throughput on WCN7850") tries to fix it using peer_id but actually that fix
> doesn't work always. From user PoV, current code has datapath issues like
> EAPOL frames getting dropped on QCC2072, and finally MLO connection failes.
> 
> Add support for logical link id based link peer resolution to fix it.
> 
> ---
> Changes in v5:
> - rebased on ToT
> - collect tags given.
> - Link to v4: https://lore.kernel.org/r/20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com
> 
> ---
> Baochen Qiang (11):
>        wifi: ath12k: fix potential OOB access due to unverified hardware link id
>        wifi: ath12k: skip hw link id match for devices without hw link id support
>        wifi: ath12k: rename ath12k_dp_peer::hw_links to link_id_map
>        wifi: ath12k: rename ath12k_dp_link_peer::hw_link_id to drv_link_id
>        wifi: ath12k: rename ath12k_skb_rxcb::hw_link_id to drv_link_id
>        wifi: ath12k: derive device id without drv_link_id for single device group
>        wifi: ath12k: add support for HTT_T2H_MSG_TYPE_PEER_EXTENDED event
>        wifi: ath12k: allocate logical link id on host when firmware does not report it
>        wifi: ath12k: derive REO RX drv_link_id per device via HAL ops
>        wifi: ath12k: derive WBM RX drv_link_id per device via HAL ops
>        wifi: ath12k: use link_id_map to resolve RX link id for all devices
> 
>   drivers/net/wireless/ath/ath12k/core.c             |   1 +
>   drivers/net/wireless/ath/ath12k/core.h             |   3 +-
>   drivers/net/wireless/ath/ath12k/dp.c               |  18 +++
>   drivers/net/wireless/ath/ath12k/dp.h               |   1 +
>   drivers/net/wireless/ath/ath12k/dp_cmn.h           |   3 +
>   drivers/net/wireless/ath/ath12k/dp_htt.c           |  17 +++
>   drivers/net/wireless/ath/ath12k/dp_htt.h           |  15 ++
>   drivers/net/wireless/ath/ath12k/dp_peer.c          | 170 +++++++++++++++++----
>   drivers/net/wireless/ath/ath12k/dp_peer.h          |  26 +++-
>   drivers/net/wireless/ath/ath12k/dp_rx.c            |   8 +-
>   drivers/net/wireless/ath/ath12k/dp_rx.h            |  16 +-
>   drivers/net/wireless/ath/ath12k/hal.h              |   6 +-
>   drivers/net/wireless/ath/ath12k/hw.h               |  22 +--
>   drivers/net/wireless/ath/ath12k/mac.c              |  53 ++++++-
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c      | 112 +++++++-------
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h      |   8 +-
>   .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.c    |   8 +-
>   .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  16 +-
>   .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |   1 -
>   .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.c    |  17 ++-
>   .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.h    |   6 +-
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c         |  17 ++-
>   drivers/net/wireless/ath/ath12k/wmi.h              |   1 +
>   23 files changed, 403 insertions(+), 142 deletions(-)
> ---
> base-commit: e3485cc885b81314c814a43db2255b1f9100928f
> change-id: 20260728-ath12k-logical-link-id-aef2481822eb
> 

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
