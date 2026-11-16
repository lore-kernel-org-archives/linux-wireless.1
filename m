Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820216;
	b=pTVFUpLXIpsWkblkEbHxybJryBKjwvVNmMJ5mQ6btUQQ2sF6tefpDbzYibCpDzjqKaMd
	 qC03E+rv6XWceM4tLaSwtyrXE4G9UQf+kQ5xK5My98goqS3tHG4Xf+q6oMsUHtKoaHjdt
	 Siji3ceg5ak/iOYWHztIE7k74IgMgCItJ+pDwgBJ55eQkw3kaGKZ9QzPzTUVgdbvLlahT
	 Pac1oC6Hzr3mhSygMB11ZLaCt9yAxKP3wV1+SVnauXqpd2H2IgJDadyz6mPw/WjJf3kOo
	 yHYNX7NjpUQh44lNtdQbj2onNbN1FuyYK5Zw9Znfe/Xms8K5u+lRGBnxwuDYhgqSODw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820216;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YHNmOrV3/wje2NqVn03EqzZH6Y/T/Hl1kXkBQsrwoDg=;
	b=MZ8JktF5raUlfctDGmVSZt+YZboi0T5ZavHYHHwiZ2AiaFB1JS9JxMljs49X+BsBJMBo
	 d8GT3X6L2UfJ/051SDKAHKSVUFuHAupMaBFHaj1Ej3VZO9NXsBxHkQk+KjLMZDIhyNfq7
	 XPXcy6I0bbMFm+NvacFDUQ613c4ib3lBNA6flgdxN/WKlnY9cNyIj59OR0eGmN6yZFtfv
	 LFKCt1pfm9+eST55dnyatHFUWjnUaIMAkJXiDNxglOqIdjRXoF6TJkOSAW2zlyn6m9f9m
	 mFnvo8XRhkRfSb2dXXu2F8MYUXx/6tPyJuBpJGm4FiZIjP0xmp+xuHMVqtk+z5SF66Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RtUGcIrM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BtoRTYpv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA84606A31C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 09:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EA84606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RtUGcIrM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BtoRTYpv
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7enUI1109776
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 09:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YHNmOrV3/wje2NqVn03EqzZH6Y/T/Hl1kXkBQsrwoDg=; b=RtUGcIrMOLhPSsmV
	HJcV7OKpdZS/fg2APPLOwjveAnPwLPCnyhFydoM060UYiCnKGrmKFzgNvAjlganS
	4MdzQuea4533HH3m+7O54E4EAJE88Vcl3XX9NReINHR4vCRhzD+O7YbIcpMJelEe
	nkz74XMR3QhWxFeOuTmHmXHOj5TVUJtaZ1PqSxDy01sMgriNgcDLjm+tbu4QtKjX
	ev2cDnStjBDmQTILoC569/tDaFT2+h0HxFgps1QEQ95nAeJsNY6m4DV/XSONoENZ
	PoGFPztFxMgs8Gk8QhJRCkkF6tsIMTE+RKNnCHlaZbXH6Ch0cz01OifSWCN/6mhS
	1S5xkw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyrmc1dnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 09:10:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36de26cb4b3so4014002eec.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 01:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794820213; x=1795425013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YHNmOrV3/wje2NqVn03EqzZH6Y/T/Hl1kXkBQsrwoDg=;
        b=BtoRTYpvvLz1RH74nDuUVt7+3jAkCpbjpxc6DZ7lKRhPsXsjyXrkR7LDTkLMXCJP/W
         jzE5F0bBE4Z+C6yWfo0mcHCi5ou5KWrLYjwk8I+S8MSyjmBhfDG3720YWGIivHW6al3G
         04dLCJAsPMHSo9za4nUeHBrUcdm5iT2wYiucM2tvY+2k7/qyir6RNOB0rbaydIqnjIZ9
         V/G1qpt/+s1S8WsB0giR6nwHQ16yztpF/lSawx6cXWwKWJktXbUn+LWG9ndCz1d6U6Dq
         vmpxx4EALweg2ugo3WRM1HdXvCqkue1Q1fvsW3x9kBoq6OZfsZdFVyL7cYZ8ZM6bR2lZ
         XASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794820213; x=1795425013;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHNmOrV3/wje2NqVn03EqzZH6Y/T/Hl1kXkBQsrwoDg=;
        b=H3MDai3GQBBfMKzNoZ/tGB2KfCNTGp9qP91OsI+4Go+SkhebtWrbLhYOM9LuYGu54x
         clA/lCGw7O09XYNgcrAsMX/lXC73ENrb8Fn8PQuYQ42MkURvmfIDwcjBE4AYhjfX8rG7
         sgpLU+9yuSfQF//1N49aXiAZBWv3TrJi7XF1jQx2V9VAf/mKkxkXHFN7ugQvmSMj46VQ
         RHf4i/xsCTFVDDJRz7Ezn5kA1a4ZbIP7pNTYFCyVV9kZhASs2qS+0223WK/S+1oANa9P
         S+HlMaf2ICB0PDptuuSToRL8R/uPZoAV+sJfKLUrXtliYAHFtePh4dEwfeHIDWfQFZj1
         8ekA==
X-Forwarded-Encrypted: i=1; AL+hErH/5SxOuxJjEgh3UpTbxBzUf8q7bJwv6EPt30+JhFy7T3alS+RRCcofRsp5CyZvDWCx+Sc7QctiJG98nFfSbQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+c3MAN0Y/SEheoM9IxCJk3ATUbUbHalt6/fz2go1FvOdUWXPoY
	KRHgPiA2W9Z8uY8qPXMgTQOc0CyTvHJQR1WgIDNF8bWlXNNMMkZJkgewOXp60E7pX+Nc1xjjjCl
	ZMU50MsrSP7II/V6hXoUu+G6Txy4TTmOCx8HPvZnj54yc6HkM2fNt+DKfkOESeOlND2sv+g==
X-Gm-Gg: AZFdTZckI7poUwF+sfgySeucvJTncCjs2odmlOtQ08Tn4TbJJfOmd/vozPj2rtktYvx
	MSDAb1FyZhtP6zMg8V1C17f7Ep6Z22WNjihUGibd5BRVcWFkCQM5cCnIRI3TkVu49UIHVQpNKgV
	cyFlAyFA614OVixN7rQfEOgqQ5wlnfSIH0huKCCEyIAFYfkEjjWyGhrsL5TNMBU37eWAgX4aLyK
	Se1LGUBC3RobMD7IKld1G909ikaXJ4JDIE4/bQwDqFz698G80vGIQI2l2Xm3FmkEuP/LgYcgHg3
	jRhYJSrMItYsZ0XpqbCdTuvx+Dwl0EqrfHETCMK3oNnvMTJvO4FYyDJbK/FfqM7CSmB6WBxAL9E
	1hnxixA248j3sJKteGWBExEGKU2JQmHHG6pmkaFM/eW8Ef1T3ttFenFhUmGP+cKDWKzGRbx0guO
	Ih9aS3F0LyvF1okDWR
X-Received: by 2002:a05:7300:72cc:b0:372:598d:c0bb with SMTP id 5a478bee46e88-37966e3ad18mr15704795eec.13.1794820212789;
        Mon, 16 Nov 2026 01:10:12 -0800 (PST)
X-Received: by 2002:a05:7300:72cc:b0:372:598d:c0bb with SMTP id 5a478bee46e88-37966e3ad18mr15704764eec.13.1794820212247;
        Mon, 16 Nov 2026 01:10:12 -0800 (PST)
Received: from [192.168.11.102] ([124.123.81.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm49500055eec.8.2026.11.16.01.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:10:11 -0800 (PST)
Message-ID: <a2313350-7374-404c-8a8d-998acb934bcf@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 14:40:07 +0530
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
Subject: Re: [PATCH] wifi: ath11k: read a station's TX rate under base_lock
To: christophergriffin05@gmail.com, Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20261114-ath11k-sta-txrate-lock-v1-1-8331a03b1000@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261114-ath11k-sta-txrate-lock-v1-1-8331a03b1000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzNiBTYWx0ZWRfXym0JPsnq4rEp
 oUJHPpGN3KOLgWFn3+8GHS8SjKl4jgM4I+00GSmfGOafXqx4K/8Xj5+oLYRVO80wO0Wg7Dzzfhn
 hrlZhFQLDMekU0icE/cp3gtaiSNDFA0=
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afac875 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=WcLwt0pvHDAIUQ3iVSLIEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=nA-HWIxgkZHMIsNwmeYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: w6gBFmQlqFvPxRcwQm7lleY4dfkBxodT
X-Proofpoint-GUID: w6gBFmQlqFvPxRcwQm7lleY4dfkBxodT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzNiBTYWx0ZWRfX6x8kdOldZG7c
 j7tNpuon9E1Y/XAJBVxRwD9pJuA1D+pA3UzmnY42HALwrFLXMfimkoOeKwjjzwip1zYMeqqmnZ2
 DdSwspsOSiNz69XDCbWLK1wTdX6Hy1mfmKFeEiTOJFa2V78KdPgvOOM1JDmjXH+FQYtFA+nNiYT
 NKPdW/SAV8Gu7yxmxnmQY0Dvu9iz/lxpMfBxFBrn+2DX2THrhdzeItf8OwWLKwFctnV2kUQogJy
 S5pPDDMmnpqYtHUJZKrV/Xr2UdDPv0WaSfkXdTJ+KiLLhV0bcNOwtQvl6B/gs3SU1yN2fig2IJQ
 7FBURILDn+ciMrwmUtPtTGoQomF8Ga0U1i4d7pGuwTLsuU1qpc7oMBDzxoLPaE3nWkUZMgih0yx
 PIcNcmon+wjCKHaRwTKkQTmepjiNlHKU45QGN/+NU+hIqJE7MKxssPQEqv/XKxbqcPaJ/79wOWP
 oA0EoGzwbcK5VRGkw+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160036

On 11/14/2026 8:04 PM, Christopher Griffin via B4 Relay wrote:
> From: Christopher Griffin <christophergriffin05@gmail.com>
> 
> ath11k_update_per_peer_tx_stats() and ath11k_dp_tx_update_txcompl()
> rewrite arsta->txrate under ab->base_lock: they clear it, then fill in
> its fields one by one. ath11k_mac_op_sta_statistics() copies it into the
> station info without that lock, so a station dump that runs while a TX
> status updates the rate can copy the HE flag with an nss of 0, and
> cfg80211 warns:
> 
>    WARNING: CPU: 3 PID: 30429 at net/wireless/util.c:1581 ieee80211_get_vht_max_nss+0x474/0x868 [cfg80211]
>    Call trace:
>     ieee80211_get_vht_max_nss+0x474/0x868 [cfg80211] (P)
>     cfg80211_calculate_bitrate+0x1e0/0x4f4 [cfg80211]
>     nl80211_put_sta_rate+0x50/0x1230 [cfg80211]
>     nl80211_put_sta_rate+0xa30/0x1230 [cfg80211]
>     nl80211_dump_station+0x4b8/0x7e0 [cfg80211]
> 
> (the line is the nss check in the inlined
> cfg80211_calculate_bitrate_he()). It was seen once in about a day on an
> IPQ8074 AP whose stations are dumped periodically by a monitoring agent.
> 
> Copy the rate under base_lock and report from the copy, as ath12k reads
> its peer rate info under its DP lock.
> 
> The change and this message were written with Claude, an AI coding
> assistant.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.r4-00683-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.5.0.1-03982-QCAHKSWPL_SILICONZ-3
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
> ---
> Found on an Arista C-360 (IPQ8074 + QCN9074) running OpenWrt, from a
> warning in its kernel log; the cause was found by reading the code.
> ath12k already reads its peer rate info under its DP lock.
> ---
>   drivers/net/wireless/ath/ath11k/mac.c | 26 ++++++++++++++++----------
>   1 file changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 1a237adaa37d1..d76eeb1ca0019 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -9425,6 +9425,7 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>   {
>   	struct ath11k_sta *arsta = ath11k_sta_to_arsta(sta);
>   	struct ath11k *ar = arsta->arvif->ar;
> +	struct rate_info txrate;
>   	s8 signal;
>   	bool db2dbm = test_bit(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT,
>   			       ar->ab->wmi_ab.svc_map);
> @@ -9435,18 +9436,23 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>   	sinfo->tx_duration = arsta->tx_duration;
>   	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_DURATION);
>   
> -	if (arsta->txrate.legacy || arsta->txrate.nss) {
> -		if (arsta->txrate.legacy) {
> -			sinfo->txrate.legacy = arsta->txrate.legacy;
> +	/* The TX status paths clear and refill txrate under base_lock */
> +	spin_lock_bh(&ar->ab->base_lock);
> +	txrate = arsta->txrate;
> +	spin_unlock_bh(&ar->ab->base_lock);
> +
> +	if (txrate.legacy || txrate.nss) {
> +		if (txrate.legacy) {
> +			sinfo->txrate.legacy = txrate.legacy;
>   		} else {
> -			sinfo->txrate.mcs = arsta->txrate.mcs;
> -			sinfo->txrate.nss = arsta->txrate.nss;
> -			sinfo->txrate.bw = arsta->txrate.bw;
> -			sinfo->txrate.he_gi = arsta->txrate.he_gi;
> -			sinfo->txrate.he_dcm = arsta->txrate.he_dcm;
> -			sinfo->txrate.he_ru_alloc = arsta->txrate.he_ru_alloc;
> +			sinfo->txrate.mcs = txrate.mcs;
> +			sinfo->txrate.nss = txrate.nss;
> +			sinfo->txrate.bw = txrate.bw;
> +			sinfo->txrate.he_gi = txrate.he_gi;
> +			sinfo->txrate.he_dcm = txrate.he_dcm;
> +			sinfo->txrate.he_ru_alloc = txrate.he_ru_alloc;
>   		}
> -		sinfo->txrate.flags = arsta->txrate.flags;
> +		sinfo->txrate.flags = txrate.flags;
>   		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
>   	}
>   
> 
> ---
> base-commit: ff4c7359e310744a7abe53cf66d921fa2969eb19
> change-id: 20261111-ath11k-sta-txrate-lock-50b530be39c2
> 

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
