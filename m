Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798269;
	b=pVD/vQz80jiSxuO5/Gj8JNVs5Bvk0T3/C+tttoP4J5JXOs+hw2glwjvkpuOzRPSbjbL3
	 MpNoONnwLue/T/H7HsLDce2Cg/f0FQji0fsoZL16aazp/jh9xV/hWO9Xxpz++D5Q33b1o
	 wKIFGMa47oq62CnVEWvBKy4dJwd6XMWHJx5nUIw4nWJcZnnjmPvbXwnafrLqpyCPjcr7S
	 jbIGBvf7NjEaHruWiX1/qIPouW4RTugfaPv8oMME138WhtxiebFXejvjgeOFWFbB8F1tx
	 OYmRgTaBtKAyFmuPxBeb7Fx6BrTo2XF1vtaF8hZMwkN2qVK+XQrsdsz6TrbAuXYC/Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798269;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=T+s/YqkfPu6xF4OVnuCJWP5RfIw0rp2fVL5Y005kWSU=;
	b=oVRqZBTxW1a/MRyPmUMae6mCjzjwmbQQUrWyVgOggSsUqFrqa/HPzt9/OeUgkMVADUvj
	 DWjwOXzaD9cqh+897CaC3ncBLnSJfjJehCrQJL2pSzvyvtHTlSdC5Jss5HiaN+C6mxpfd
	 YLe0c+6W8GYGgzijXw7KTlA54xRrdnS5ghsLbW0OZ+jVe39qT8yaIlzn+foFTmpfBKI1q
	 nznSwNaScitTOcwbmMmZkgR0m1gwP+VFs3rd47ZYYpcLE+OJdp6RTsFNDgui4tLq8BwRc
	 VLKTSHsJI9DZBtJYK6y4cg22Tp6VNHvg3a0HCxHBp3MVdngaa09mh3Ep23g0INiarjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZ0mtxA2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LFpxagt7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DA5606A329
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 03:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57DA5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZ0mtxA2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LFpxagt7
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1Kx7n2658607
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 03:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T+s/YqkfPu6xF4OVnuCJWP5RfIw0rp2fVL5Y005kWSU=; b=CZ0mtxA2DzDQ8HYl
	btsGnnbN5VpMegPO5gUYmTzsj1r9EEiVKe86NMJMsCYYsJhw0YNb4GsXJ5R6A4SY
	1Hu3xDFmP6SeTGSt7IqUQXjocQ0GvPDgN+sab0flbKYSifp1TsHEjz1B5JEJYT91
	Qw4PCh48QDeTEo+lbMcTUUbRlnMPEZyQm1z94DRvSFG22Lf/mlGuZ5nk7FHoE7nV
	vLtwYw581V0yY1eSmjMu8OhYX3p4mpZGriZwWeExHm1kNIPhynx9facweGSlEd2W
	uu2/Tv/erq9mStoUM1S7JwE2FCqdhRd4FbYfcSuIwboCtTghQKY24GhaDIFl/nc8
	f18aTQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmccdp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 03:04:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso2909253a91.1
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 19:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794798266; x=1795403066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+s/YqkfPu6xF4OVnuCJWP5RfIw0rp2fVL5Y005kWSU=;
        b=LFpxagt7sYrRirvIGb9a2MKJIB9qCihkn/1bF929xyPniTdIV1X+ddN6wHA6izaUxI
         d5+ARI/AQO+bjdKDumYtG30ot8+boLQPDElO6VhAleKsVlrnQuKnjGq4l3/E3pFn001H
         83R+iWZhg456jXsT7SdRZs8TFBEonS8uyp+ESPMsvrKRLLrqkIlrOhcRuwM8EOAATsSQ
         PajR+B2WVIxdzbTRhYZ5JrB5uN03hUQuaa927UrFh4SDWq/hu0G9yAcjn4SqaqJBluSI
         26Zdd/WDIVWWmipTLrWur0o7iabWyiDDSsdTm88H9gyOf8cgAj0gSxkxFSAZjPTw0Y7p
         7ogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798266; x=1795403066;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+s/YqkfPu6xF4OVnuCJWP5RfIw0rp2fVL5Y005kWSU=;
        b=k7+X3QAgAFUmWB5lHJUQwQ47k4UE/jHMpCa8S/3CwCWUi7dzElzd+XQ3pwwRCUiiiy
         UZ/ussMCmvrjR5nLkZOni5bisnzLO8U4EmoeT040Wf8PTLwGdNr0oij8opvqZr/WvRS3
         AcG5RC1CYaI3ggnHR98vNTXa4YZy8vLUGPv3dQESF4U166c/7OU3pWzdEe7RvCzMQD84
         UOTN9XUfVzf0rvpT8gJ9002hE/qQQwvrAngL5fz+vwm+u8j7o6GegaQ4/NiUpRb/vsz5
         9c9FkHqiXTnjmwuNVibSEaFpHAc2pF/whPJm3e5FL9QEPlwNiaVoNBIOzNNY7mL7mx0B
         CmdA==
X-Gm-Message-State: APuU4Z/JDVGsxsxkgNmt/FHrXqC+0Wv2iHjPMP5c861kpJluqdMZe981
	obey4sxJGVWw512RInSM9fjOoRcJ2HKOvYPRaF6w1eCokxi2H772VeCioGxL2tfA7Qt/mLb7z+4
	+vher0aZ24CwB2WkS5Xe1tssPC9O1IuC09a01RPoUF/mfS9s+XubjreBNtHkGfqC773D0bA==
X-Gm-Gg: AYBFou3omgfOL0+MbcMvC0rf7Y66W0YRjoUKEaJc/chioKHXJVMlCD3y38ObDoshGu4
	+43tyKcgn5Hy3nPzIG+Lc+SZwQtzRX9/yoCUih+4uG1FVrMjMLsdAqlZbFxEes++0YcG2wE/Dte
	ykEPV7cJ64YDc66lILhM8Zyqu0H+L5+t3QmEjYuR7nRGJ4kgH0KSzU6Fa1kTQ+42k3p80aojyu1
	S2Pu0Ur5nKNhLvjA0MD9xZ+ntIcyW+egPPG6QbmYoDh0Q2BhWs8/vyxz9L7AJyCEd+SmR6jaV8D
	+I9INJEC9VRfz5BtDORCFAsifbicq/LDo8dhFwiaQTO9WB/pdAn2sxCsah/5NnI/A7BGOz7S/og
	B1c33pntNeyZCGZYPumRLERWAeqpaUYaxIIB0Xem9NOjHvQESSXP7JBjwQ29WQe5/tarZ7MdHe8
	FGoyLStKs/dXlrwKt/nBy3OxsOuyNojhuu2je7KJiA0Q3u
X-Received: by 2002:a17:90b:5112:b0:3ac:9ad9:6afe with SMTP id 98e67ed59e1d1-3b1b0d481c5mr6099337a91.39.1794798265658;
        Sun, 15 Nov 2026 19:04:25 -0800 (PST)
X-Received: by 2002:a17:90b:5112:b0:3ac:9ad9:6afe with SMTP id 98e67ed59e1d1-3b1b0d481c5mr6099319a91.39.1794798265100;
        Sun, 15 Nov 2026 19:04:25 -0800 (PST)
Received: from [10.133.33.65] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6dd2dsm18994350a91.2.2026.11.15.19.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 19:04:24 -0800 (PST)
Message-ID: <a346e622-8fe9-4912-9ded-b531b1bdc82e@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:03:59 +0800
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20261114-ath11k-sta-txrate-lock-v1-1-8331a03b1000@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261114-ath11k-sta-txrate-lock-v1-1-8331a03b1000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxMSBTYWx0ZWRfX5oCXkr9Tfklo
 MuUCrK5Y9iegUp19cT3eQK/gBmLcL6C+okCh2hq5aTHMus+YUtkidd18Tw6w1PugPYLUsnsYHxR
 RulbVo4jDuezAj1z+l4/DA7NAcsuapI=
X-Proofpoint-ORIG-GUID: lf6ndanazbikrdew2EG-M8q6zPZyTIIl
X-Proofpoint-GUID: lf6ndanazbikrdew2EG-M8q6zPZyTIIl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxMSBTYWx0ZWRfX4jqLNO3RUkHI
 wknfyZkgkA79W4tYpN3AeYIypWSMsQknYBgDcPr6klWIdJRaCYlc7xcDuheKQU9yBJM7xnk4Y4l
 IEpmer9/nilkgaTIlxIxH0ZqsGkmpmitzFA6nej5TvwCYQPowj+4ocoWbtK8T8gb8guDsfuoMVP
 7nUDQS6uMDtW/j20rTzIvm5cS55ozEMXbLpuzLSBrB+2iT+Sm2RDV/kYh9fDi57c+HbTHAjtC3M
 Zy05wXo+2rKdK2n6TI4juKAheH2v4jIuITd+CNPUYEGVQhpsnDHDDuNmfyBA68ovL4+UM2+zpt9
 25t9DIUZtqzn0xWtidGOTvNVCxngeNsUznShnpHNO4/uKSl+mPoPioXePZK6p8ryjmaeqLwdv4D
 wt/ZxsfkZAdNyuDiQ1+bKGvTBNsIEv5R0Rrv+YIZ9xQL68yC203lQLpPslaK8eFUFLuQYT5Nw1y
 a8cErEI+kCgS0QYCzeQ==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afa72ba cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=nA-HWIxgkZHMIsNwmeYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160011



On 11/14/2026 10:34 PM, Christopher Griffin via B4 Relay wrote:
> From: Christopher Griffin <christophergriffin05@gmail.com>
> 
> ath11k_update_per_peer_tx_stats() and ath11k_dp_tx_update_txcompl()
> rewrite arsta->txrate under ab->base_lock: they clear it, then fill in
> its fields one by one. ath11k_mac_op_sta_statistics() copies it into the
> station info without that lock, so a station dump that runs while a TX
> status updates the rate can copy the HE flag with an nss of 0, and
> cfg80211 warns:
> 
>   WARNING: CPU: 3 PID: 30429 at net/wireless/util.c:1581 ieee80211_get_vht_max_nss+0x474/0x868 [cfg80211]
>   Call trace:
>    ieee80211_get_vht_max_nss+0x474/0x868 [cfg80211] (P)
>    cfg80211_calculate_bitrate+0x1e0/0x4f4 [cfg80211]
>    nl80211_put_sta_rate+0x50/0x1230 [cfg80211]
>    nl80211_put_sta_rate+0xa30/0x1230 [cfg80211]
>    nl80211_dump_station+0x4b8/0x7e0 [cfg80211]
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
>  drivers/net/wireless/ath/ath11k/mac.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 1a237adaa37d1..d76eeb1ca0019 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -9425,6 +9425,7 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>  {
>  	struct ath11k_sta *arsta = ath11k_sta_to_arsta(sta);
>  	struct ath11k *ar = arsta->arvif->ar;
> +	struct rate_info txrate;
>  	s8 signal;
>  	bool db2dbm = test_bit(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT,
>  			       ar->ab->wmi_ab.svc_map);
> @@ -9435,18 +9436,23 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>  	sinfo->tx_duration = arsta->tx_duration;

arsta->rx_duration and arsta->tx_duration are u64 and are also only updated under
ab->base_lock, so on 32-bit they can tear the same way. Since the lock is taken here
anyway, moving those two reads into the same critical section would cost nothing, and is what
ath12k_mac_op_link_sta_statistics() does under dp_lock.

Not a blocker, fine to leave it for a separate patch.

>  	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_DURATION);
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
>  		} else {
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
>  		}
> -		sinfo->txrate.flags = arsta->txrate.flags;
> +		sinfo->txrate.flags = txrate.flags;
>  		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
>  	}
>  
> 
> ---
> base-commit: ff4c7359e310744a7abe53cf66d921fa2969eb19
> change-id: 20261111-ath11k-sta-txrate-lock-50b530be39c2
> 
> Best regards,
> --  
> Christopher Griffin <christophergriffin05@gmail.com>
> 
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

