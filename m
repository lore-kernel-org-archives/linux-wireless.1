Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553672;
	b=5aRCVKaHEk45ioN7kf5m4aoO8osTPyMXlebMM5UTHs98LpSYhfg2JDPyJiJBHFSWHsq3
	 pYS1zXdMleXUn48tQRoXOqWs08+v9Lh9SNMvpHSmEyYCksF5kVNtIURnaNHQ1r0nkLxfV
	 F9Y0ibrI1XFpWuIdU5migxmaGRQue8wUJquCh8w8o21onDdLuPupv600JbU44hnQ4wvoK
	 vEuyoIhSdhaAO70TwJI/YVUkXJSdHGDs+PGpZyAp4vcp2q73R4Ex2GCzm5KWyxjPerE8F
	 KL9klkD6TYGWUZUFDXmf69fvzmIDodSbQWv/KUzZSxKwqi4BIQloIApd7RBdtRpv9eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553672;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zGHtBxAPYsJ50s7xgldA7nxDdVzLshBLi9zRXsaND/k=;
	b=Xau0sjj7btlO4aKu1RBe+7jDXUOt45mA4x5wRAIBnOPNsolW0nSles2aMAhflenRfDkv
	 tR3OGiUT76KM2Lc7pCyzVvCvhAhfSmt2wyjW3tixFUtbkygKjeHlAOz2K62pMkkNIh40q
	 ZCV950BXeiO15/JGwoBeP4VhNE2GSAFyNgMv67yB+F1a9jzwSutMwZhWmqHfzrxwZxyrl
	 iPtAC0GEZq37MH07Bse6yD9giv+ug8p3S1hSUoDIsz5YLrpxDpN4Yu9HcdbXB429Af9ML
	 BkXWmpTUeiAYNCPF5A+ntGijJlMplcmOAb0viUiXEx0fQ6WJUUecOHPWZTBsmpEFz4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=odAzipFZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jxmVAd8E;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7494D606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 20:54:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7494D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=odAzipFZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jxmVAd8E
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXQIC2036997
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 20:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zGHtBxAPYsJ50s7xgldA7nxDdVzLshBLi9zRXsaND/k=; b=odAzipFZyiXyd9F5
	CbUqOf+lpvMImhKFQC8Z9QoAWbLGMP3XPPkb7uD+hbGw//MmaUr7Kle8rvxRugv0
	P0eGzh8p89GneitxX4Dmn88enhlk374oPqx5fHBtkCV7u+zzzk61JKUzeff9dAQt
	WuiU1/hbgjM6t01Y0wPsOH3b+dO/navUE951FFXwsPt45S8B/GVYq5CkkJszmJc8
	6vKoRcCkeFGTol1ryyaUDgyL0ubAjxw+l4k6XwvpvdL5QZENJzhYN8uex8GdBz4A
	fAtuFHvZbS6I+TKBkSttYLNjfzBYXR04YO5aYV4nTZNYnupdG9KII52+Qh5wohSB
	Xozlow==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5dngh9tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 20:54:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so7836678eec.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795553670; x=1796158470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zGHtBxAPYsJ50s7xgldA7nxDdVzLshBLi9zRXsaND/k=;
        b=jxmVAd8EaWJvjjC1lSyTuG6AYY2XUduwDeZMeKOUet7nJ5hFZKz6Zxi9xGlfqKERA+
         d8z2VgC1cSmpssd7+UIV25XSWYvwQyNsOF3TFf82aTTMravYR41YMyYq7qobZKyg9Qp6
         1S91sXAkA1aFLBQAcJzoVPJA5S6WljLiLSrO4KoVMGy3A639sXIGvMKtWVYYih9xNxe1
         b4tUA2aE6eW8+hDdc5vtkZLgNdSyI4LSM+ixAe0ZMZrHWEPVl6kMsMPBRFAHKVloZMi4
         USh6pkRwtOX1mtkMR2fKD1b23aevhjZ8GdHU8Cl/Wbs83/x1TJO9mDRX2RYliqk8PLFL
         Bzow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553670; x=1796158470;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zGHtBxAPYsJ50s7xgldA7nxDdVzLshBLi9zRXsaND/k=;
        b=ImEKveKuoVn33/vca4OfskhoMNPIpyxyGlAYaY32nPNZ0ir0ZCAl4daGzoiEGm0Wvo
         SF1ThVzIIhh2AYq91iEe1hxi5Vw/NvP0UD8tTMEY13gcuZ58pBlN2aazQKmaISeXYzQf
         uzsqqr1bKpXhBM8TVlc9Fe2UVrJlh+TJLDEI3+gGlxp3rtgFlzkvJIxEJ79z4j24VjdN
         AsvGs3dUhTS3UKzp4A7UIKZz6vRQP9ufXzVJiLgLG0P08M73N+Gn29kiVJZ2OUhG36ux
         /XOlNT2lGHkz4WhyuvWkpj2EgwvrcTMzMQ+/j2Bn1QC5mhi8Way/vZnj9AMTebsNA9tU
         FwBQ==
X-Forwarded-Encrypted: i=1; AL+hErGxYkmmTbg9/n0q/1vJ1w2soVP0kWPHRx/Cgwcya/Wm4GrceHlNnzxdRayz8tga6DULK05aODLMMlvqALcphQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+BeFbx1n+t2i2xBVaM5j0DGvRSiwvlEviv9HBpFEgsUYhMeUeK
	KPeAIL8BljG7cx18WN5F62f8xbKj2o38NC9V/LUSebe3hPrVVyWR4rBG3m6O+0W+BRUqb8IRpdp
	Zeqm0xVzg5dit6sIyEkvtU/aShoAGuBezGHdcy3Y2yCm4+kS9lGvodEE64QvUeV0r69yHrQ==
X-Gm-Gg: AZFdTZc+uowDc+l5S9uXlakDNYN5TvMqyjYBNDoww+XArMsV57cGJRIJrm2KDdEqghK
	EXSV8ClTKYuz4xctgcvHgOrXggKLlrXeMwih92bkMtrKmz4em8srcHHZV1JA+yJs0cGzpkFSiSM
	s2k/ak/eJVcTqBMmt0tH6ebK1tjX9N9vKWurmAfte8YiBx194mZ2m6LBshOwf8NxwADVvlgWPyw
	LTBzF9Gwea42d67CyG3WUjWGemjm6AUhmPH2I+SNCWBWsvcQVkkMP2Z+TRACUC+KchfoIcGP6hQ
	I8G3mBVtFFccBp9RDC8RZNOQXxme0ulSu0vx61ApYT0jA4IRpdam2y76JlyXtfNy21Le3H4Ycsx
	WW/JwbTJ9etOocyocBroC0R/5/lGoySS7ClrAjb1ilxADLzzOzzJgu9Wql2O47UxAdpY/TEj93U
	nGFacBGqo7d83G6HwA
X-Received: by 2002:a05:693c:8641:20b0:383:50b7:1d78 with SMTP id 5a478bee46e88-38571223ee7mr17921598eec.40.1795553669051;
        Tue, 24 Nov 2026 12:54:29 -0800 (PST)
X-Received: by 2002:a05:693c:8641:20b0:383:50b7:1d78 with SMTP id 5a478bee46e88-38571223ee7mr17921568eec.40.1795553668440;
        Tue, 24 Nov 2026 12:54:28 -0800 (PST)
Received: from [192.168.11.103] ([124.123.81.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm46139437eec.15.2026.11.24.12.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:54:27 -0800 (PST)
Message-ID: <d10c7d75-2113-454d-bffb-a71b826ccff6@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 02:24:24 +0530
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
Subject: Re: [PATCH ath-next 7/7] wifi: ath12k: handle MLO active link updates
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
 <20261118025520.39269-8-miaoqing.pan@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261118025520.39269-8-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA4MiBTYWx0ZWRfXxB0gngMpmoaX
 gBQVvmusIc1o5wCi9Q54awpWZdnvs3FtvmTAeWE1XxtBI3QGnf9yCe5FwMYWRYMgTw5LR+LZNKB
 j1lLMqZ1o2PIAqgkbCqi1aIzRl25gpE=
X-Proofpoint-ORIG-GUID: Gz1VHSxyi6zIVg5ix4mXrZ6AOex946ti
X-Proofpoint-GUID: Gz1VHSxyi6zIVg5ix4mXrZ6AOex946ti
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA4MiBTYWx0ZWRfX7JAtUMChxUXX
 LyjHXU3qZRBH8i6riysVIdl7qMAEcM+zfHKVQ6Wfq3t4Ebe+pBMe/7v4xMMxYnA5Ctqjhk0RUx1
 wasgx0CaIE9uUs/ECgP3WtIH+8ozfV+u2pcmPbHi20COHjYJD+pk7d5ItDighl8+SEhDy9DokPM
 p09TeQe+7YcnIDPtkFWrEyzkX7S5TJsNAD7d6K3qntma5SarhvkW730MxK/BeKEK2aJ2HrAS4zg
 o0EIQQ+eHw5Yd20Pbq7136q6PRkSMsSYpzL97uMzdK/fLM+084mJna9dvnVivFu6kGYlRdnAdEC
 r8trEEjEbc/MMYAWFMGbk2T+tMC99XrnRo+S6gUIFjBvMOf9k2uaP7QRM/NA0o8GZEhCJl9eSVB
 REfJpBzYcHgihj5L+UPtlkw262ZGp/bbTeT5xYg9at0yj+CoInPscq8PGL2NFbK82NxRepithhw
 b+OwxIP8TBwh09DHYYA==
X-Authority-Analysis: v=2.4 cv=U9cHnuru c=1 sm=1 tr=0 ts=6b05f986 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=WcLwt0pvHDAIUQ3iVSLIEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lZnIY_QNQNzb0u9bTJAA:9 a=zlulEwOhvs9ORIPW:21
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240082

On 11/18/2026 8:25 AM, Miaoqing Pan wrote:
> ath12k_mac_op_change_sta_links() handles both valid-link and active-link
> changes from mac80211. For an active-link change, old_links and new_links
> are the active sets. The callback returned early whenever new_links was
> smaller than old_links, and outside connect nothing sends an active-link
> command to firmware. So when an associated MLO STA deactivates a link,
> e.g. active links 0x5 -> 0x1, firmware keeps link 2 active while
> mac80211 has already released its channel context.
> 
> Sync the active links to firmware from the callback once the STA is
> AUTHORIZED:
> 
> - Create link STAs for sta->valid_links instead of new_links. Firmware
>    cannot remove a single link sta, so removals are only logged and are
>    left to STA removal.
> - Take the active set from channel contexts: a link with a link STA and
>    a link vif is active if it holds a chanctx, inactive otherwise.
>    mac80211 releases the chanctx of a deactivated link and assigns one to
>    a newly activated link before it calls the callback.
> - Send WMI_MLO_LINK_SET_ACTIVE only when this set differs from the one
>    last programmed, cached per vif. Send it to each device that holds
>    vdevs of the STA, with that device's links, and wait up to 5 seconds
>    for each response. Two active links on the same MAC use
>    INACTIVE_LINK_NUM, as at connect, and that command is not waited for.
>    Update the cache only if all devices succeed, so a failed sync is
>    retried on the next callback.
> - Reset the cache on ASSOC -> AUTHORIZED, so the first sync after each
>    (re)connect is always sent. This also covers hw restart, where
>    mac80211 replays the station state transitions.
> 
> If the device crashes while a request is pending, the waiter still holds
> the wiphy lock. ath12k_core_pre_reconfigure_recovery() therefore releases
> the waiter before it takes the lock, otherwise recovery stalls until the
> timeout expires.
> 
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/core.c |  15 ++
>   drivers/net/wireless/ath/ath12k/core.h |  20 ++
>   drivers/net/wireless/ath/ath12k/mac.c  | 241 +++++++++++++++++++++++--
>   drivers/net/wireless/ath/ath12k/wmi.c  |   9 +-
>   drivers/net/wireless/ath/ath12k/wmi.h  |   1 +
>   5 files changed, 271 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 42a9cd28c652..183da4cb5e64 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -1524,6 +1524,19 @@ void ath12k_core_halt(struct ath12k *ar)
>   	idr_init(&ar->txmgmt_idr);
>   }
>   
> +static void ath12k_core_abort_mlo_link_set_active(struct ath12k_base *ab)
> +{
> +	struct ath12k_mlo_link_set_active_req *req;
> +
> +	rcu_read_lock();
> +	req = rcu_dereference(ab->mlo_link_set_active_req);
> +	if (req) {
> +		req->status = -ESHUTDOWN;
> +		complete(&req->done);
> +	}
> +	rcu_read_unlock();
> +}
> +
>   static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
>   {
>   	struct ath12k_hw_group *ag = ab->ag;
> @@ -1538,6 +1551,8 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
>   	if (ab->is_reset)
>   		set_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags);
>   
> +	ath12k_core_abort_mlo_link_set_active(ab);
> +
>   	for (i = 0; i < ag->num_hw; i++) {
>   		ah = ath12k_ag_to_ah(ag, i);
>   		if (!ah || ah->state == ATH12K_HW_STATE_OFF ||
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 7c7057468916..74f184d283b7 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -401,6 +401,12 @@ struct ath12k_vif {
>   	struct ath12k_link_vif deflink;
>   	struct ath12k_link_vif __rcu *link[ATH12K_NUM_MAX_LINKS];
>   	struct ath12k_vif_cache *cache[IEEE80211_MLD_MAX_NUM_LINKS];
> +	/*
> +	 * Last active/inactive link state programmed to firmware via
> +	 * WMI_MLO_LINK_SET_ACTIVE. Zero means unknown: forces a resend.
> +	 */
> +	u16 fw_active_links;
> +	u16 fw_inactive_links;
>   	/* indicates bitmap of link vif created in FW */
>   	u32 links_map;
>   	/* Must be last - ends in a flexible-array member.
> @@ -797,6 +803,12 @@ struct ath12k {
>   	} incumbent_signal_interference;
>   };
>   
> +struct ath12k_mlo_link_set_active_req {
> +	struct completion done;
> +	int status;
> +	struct rcu_head rcu_head;
> +};
> +
>   struct ath12k_hw {
>   	struct ieee80211_hw *hw;
>   	struct device *dev;
> @@ -1153,6 +1165,14 @@ struct ath12k_base {
>   #endif /* CONFIG_ACPI */
>   
>   	struct ath12k_hw_group *ag;
> +
> +	/*
> +	 * Set-active request in flight to this device, NULL when idle. Freed
> +	 * via kfree_rcu(). The links of an MLO STA can be on several devices,
> +	 * and each device is programmed separately, so at most one request is
> +	 * outstanding per device.
> +	 */
> +	struct ath12k_mlo_link_set_active_req __rcu *mlo_link_set_active_req;
>   	struct ath12k_wsi_info wsi_info;
>   	enum ath12k_qmi_firmware_mode fw_mode;
>   	struct ath12k_ftm_event_obj ftm_event_obj;
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index dfb0f6e678ac..885eedbbdd67 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -7667,6 +7667,8 @@ static int ath12k_mac_mlo_sta_update_link_active(struct ath12k_base *ab,
>   	u8 num_mlo_vdev = 0;
>   	u8 link_id;
>   
> +	lockdep_assert_wiphy(hw->wiphy);
> +
>   	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
>   		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
>   		/* make sure vdev is created on this device */
> @@ -7982,6 +7984,14 @@ int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
>   
>   	if (ieee80211_vif_is_mld(vif) && vif->type == NL80211_IFTYPE_STATION &&
>   	    old_state == IEEE80211_STA_ASSOC && new_state == IEEE80211_STA_AUTHORIZED) {
> +		/*
> +		 * The cached active link state is only updated while AUTHORIZED,
> +		 * so reset it on each ASSOC -> AUTHORIZED. The next active-link
> +		 * sync then sends the state to firmware.
> +		 */
> +		ahvif->fw_active_links = 0;
> +		ahvif->fw_inactive_links = 0;
> +
>   		for_each_ar(ah, ar, i) {
>   			ab = ar->ab;
>   			if (prev_ab == ab)
> @@ -8243,6 +8253,194 @@ static struct ath12k_link_sta *ath12k_mac_alloc_assign_link_sta(struct ath12k_hw
>   	return arsta;
>   }
>   
> +static struct ieee80211_chanctx_conf *
> +ath12k_mac_link_chanctx(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
> +			u8 link_id)
> +{
> +	struct ieee80211_bss_conf *link_conf;
> +
> +	link_conf = wiphy_dereference(hw->wiphy, vif->link_conf[link_id]);
> +	if (!link_conf)
> +		return NULL;
> +
> +	return wiphy_dereference(hw->wiphy, link_conf->chanctx_conf);
> +}
> +
> +struct ath12k_mlo_dev_links {
> +	u8 active_vdev[IEEE80211_MLD_MAX_NUM_LINKS];
> +	u8 inactive_vdev[IEEE80211_MLD_MAX_NUM_LINKS];
> +	u32 active_freq[IEEE80211_MLD_MAX_NUM_LINKS];
> +	unsigned int num_active;
> +	unsigned int num_inactive;
> +};
> +
> +static u16 ath12k_mac_mlo_vif_active_links(struct ieee80211_hw *hw,
> +					   struct ieee80211_vif *vif,
> +					   unsigned long links)
> +{
> +	u16 active = 0;
> +	u8 link_id;
> +
> +	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
> +		if (ath12k_mac_link_chanctx(hw, vif, link_id))
> +			active |= BIT(link_id);
> +	}
> +
> +	return active;
> +}
> +
> +static void ath12k_mac_mlo_sta_collect_dev_links(struct ieee80211_hw *hw,
> +						 struct ath12k_vif *ahvif,
> +						 struct ath12k_base *ab,
> +						 unsigned long links,
> +						 struct ath12k_mlo_dev_links *dl)
> +{
> +	struct ieee80211_chanctx_conf *conf;
> +	struct ath12k_link_vif *arvif;
> +	u8 link_id;
> +
> +	dl->num_active = 0;
> +	dl->num_inactive = 0;
> +
> +	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
> +		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
> +		if (!arvif || !arvif->is_created || arvif->ar->ab != ab)
> +			continue;
> +
> +		conf = ath12k_mac_link_chanctx(hw, ahvif->vif, link_id);
> +		if (!conf) {
> +			dl->inactive_vdev[dl->num_inactive++] = arvif->vdev_id;
> +			continue;
> +		}
> +
> +		dl->active_freq[dl->num_active] = conf->def.chan->center_freq;
> +		dl->active_vdev[dl->num_active++] = arvif->vdev_id;
> +	}
> +}
> +
> +static bool ath12k_mac_mlo_dev_same_mac(struct ath12k_base *ab,
> +					const struct ath12k_mlo_dev_links *dl)
> +{
> +	return dl->num_active == 2 &&
> +	       ath12k_mac_freqs_on_same_mac(ab, dl->active_freq[0],
> +					    dl->active_freq[1]);
> +}
> +
> +static int ath12k_mac_mlo_sta_send_inactive_link_num(struct ath12k_base *ab,
> +						     struct ath12k_mlo_dev_links *dl)
> +{
> +	return ath12k_mac_mlo_sta_set_link_active(ab,
> +						  WMI_MLO_LINK_FORCE_REASON_NEW_CONNECT,
> +						  WMI_MLO_LINK_FORCE_MODE_INACTIVE_LINK_NUM,
> +						  NULL, dl->active_vdev, dl->num_active,
> +						  NULL, 0);
> +}
> +
> +static int ath12k_mac_mlo_sta_send_set_active(struct ath12k_base *ab,
> +					      struct ieee80211_vif *vif,
> +					      struct ath12k_mlo_dev_links *dl)
> +{
> +	struct ath12k_mlo_link_set_active_req *req;
> +	enum wmi_mlo_link_force_mode mode;
> +	int ret;
> +
> +	req = kzalloc_obj(*req);
> +	if (!req)
> +		return -ENOMEM;
> +
> +	init_completion(&req->done);
> +	rcu_assign_pointer(ab->mlo_link_set_active_req, req);
> +
> +	mode = dl->num_inactive ? WMI_MLO_LINK_FORCE_MODE_ACTIVE_INACTIVE :
> +				  WMI_MLO_LINK_FORCE_MODE_ACTIVE;
> +
> +	ret = ath12k_mac_mlo_sta_set_link_active(ab,
> +						 WMI_MLO_LINK_FORCE_REASON_NEW_CONNECT,
> +						 mode, vif->cfg.ap_addr,
> +						 dl->active_vdev, dl->num_active,
> +						 dl->inactive_vdev, dl->num_inactive);
> +
> +	if (!ret && !wait_for_completion_timeout(&req->done,
> +						 ATH12K_MLO_LINK_SET_ACTIVE_TIMEOUT_HZ)) {
> +		ath12k_warn(ab, "timeout waiting for mlo set active links resp\n");
> +		ret = -ETIMEDOUT;
> +	}
> +
> +	if (!ret && req->status)
> +		ret = -EIO;
> +
> +	rcu_assign_pointer(ab->mlo_link_set_active_req, NULL);
> +	kfree_rcu(req, rcu_head);
> +
> +	return ret;
> +}
> +
> +static int ath12k_mac_mlo_sta_sync_active_links(struct ath12k_hw *ah,
> +						struct ath12k_vif *ahvif,
> +						struct ath12k_sta *ahsta,
> +						struct ieee80211_sta *sta)
> +{
> +	struct ath12k_base *ab, *prev_ab = NULL;
> +	struct ieee80211_hw *hw = ah->hw;
> +	struct ath12k_mlo_dev_links dl;
> +	unsigned long links;
> +	u16 active, inactive;
> +	struct ath12k *ar;
> +	int ret;
> +	int i;
> +
> +	lockdep_assert_wiphy(hw->wiphy);
> +
> +	links = ahsta->links_map & ahvif->links_map;
> +
> +	/*
> +	 * A link holding a channel context is active. The links of an MLO STA
> +	 * can be on different devices, so the active set is derived over all
> +	 * links and each device is then programmed with the links it holds.
> +	 */
> +	active = ath12k_mac_mlo_vif_active_links(hw, ahvif->vif, links);
> +	inactive = links & ~active;
> +
> +	if (!active) {
> +		ath12k_hw_warn(ah, "no active link for sta %pM\n", sta->addr);
> +		return -EINVAL;
> +	}
> +
> +	if (active == ahvif->fw_active_links &&
> +	    inactive == ahvif->fw_inactive_links)
> +		return 0;
> +
> +	for_each_ar(ah, ar, i) {
> +		ab = ar->ab;
> +		if (ab == prev_ab)
> +			continue;
> +		prev_ab = ab;
> +
> +		ath12k_mac_mlo_sta_collect_dev_links(hw, ahvif, ab, links, &dl);
> +
> +		if (!dl.num_active && !dl.num_inactive)
> +			continue;
> +
> +		if (!dl.num_active) {
> +			ath12k_hw_warn(ah,
> +				       "cannot deactivate all STA links on a device\n");
> +			return -EOPNOTSUPP;
> +		}
> +

for a configuration where more than one QCN9274 is combined in a hw 
group and advertised under one wiphy, the only link can be deactivated on ab

ah->radio[0] -- ab-1 QCN9274 5GHz
ah->radio[1] -- ab-2 QCN9274 6GHz

This setup can associate as 5+6GHz ML STA and if mac80211 deactivates 
one link say 5GHz, ath12k_mac_mlo_sta_collect_dev_links() will report 
dl.num_active as 0 and dl.num_inactive as 1 which is still valid.

I tested this with such a setup and when AP removes one link i get below 
errors,

root@buildroot:~# [  208.620233] wlan0: authenticate with 
00:03:7f:01:57:45 (local address=32:43:40:d5:13:f0)
[  208.620278] wlan0: send auth to 00:03:7f:01:57:45 (try 1/3)
[  208.646676] wlan0: authenticate with 00:03:7f:01:57:45 (local 
address=32:43:40:d5:13:f0)
[  208.646705] wlan0: send auth to 00:03:7f:01:57:45 (try 1/3)
[  208.656809] wlan0: authenticated
[  208.662463] wlan0: associate with 00:03:7f:01:57:45 (try 1/3)
[  208.681771] wlan0: RX AssocResp from 00:03:7f:01:57:45 (capab=0x111 
status=0 aid=1)
[  208.706457] wlan0: [link 0] local address 32:43:40:d5:13:f0, AP link 
address 00:03:7f:01:57:45 (assoc)
[  208.707397] wlan0: [link 1] local address 4a:cd:9a:9c:d5:a5, AP link 
address 00:03:7f:01:56:84
[  209.128875] wlan0: associated


root@buildroot:~# [  278.858680] wlan0: MLO Reconfiguration: work: 
valid=0x3, removed=0x2
[  278.860079] ath12k_wifi7_pci 0000:01:00.0: cannot deactivate all STA 
links on a device
[  278.864245] ath12k_wifi7_pci 0000:01:00.0: failed to sync mlo active 
links for sta 00:03:7f:01:57:45: -95
[  278.871936] ------------[ cut here ]------------
[  278.881468] WARNING: net/mac80211/link.c:650 at 
_ieee80211_set_active_links+0x398/0x3c8 [mac80211], CPU#0: kworker/u17:0/39
[  279.021054] Call trace:
[  279.028167]  _ieee80211_set_active_links+0x398/0x3c8 [mac80211] (P)
[  279.030428]  ieee80211_set_active_links+0x88/0x138 [mac80211]
[  279.036677]  ieee80211_ml_reconf_work+0xc8/0x13c [mac80211]
[  279.042579]  cfg80211_wiphy_work+0x94/0xcc [cfg80211]
[  279.047961]  process_one_work+0x178/0x2b0
[  279.053168]  worker_thread+0x180/0x2f4
[  279.057160]  kthread+0xf8/0x118
[  279.060806]  ret_from_fork+0x10/0x20
[  279.063845] ---[ end trace 0000000000000000 ]---



[Apologies for not catching this earlier :(]

-- 
Ramesh
