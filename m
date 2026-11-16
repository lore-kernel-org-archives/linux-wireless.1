Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844266;
	b=rDDcafYeQBooCVjKzvnUyQilfp/HI7ddDHCiVJJ6yxiVccBR0FzceeKttEZh86p13hUf
	 xPDRCbN4dhdg+Eb5BZa6rVjqZlT4J2Jy9VH1ilsj7dIO1NQ8XFu9peOXBk49pBG5anFBI
	 QqEzVxT1cWFzaxAhL4PdGko0ins5x8Mn2bAua87acFjYAiEorIvyMLuYQ1Ung27LnwQ8q
	 sHUUjr7fAapy1jf86V/lrbBIu/QNxuzb0DXJQcVZJ0G/sbEbPuK7wuoZOC7pLPzHazEFj
	 hqKMDOIbqBzn3Fthwg+l2HBAmFmWCi1elYzX8KUSQTz+TLkwozb6d+hMYO7/25SRj1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844266;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T15AuhE31UhCQiNlKm1KpqpzGHM4L5aNNLLLTI73GWU=;
	b=i0qiWvH6eUbtg/YA2Ok+twB3U1SvUBvM5BtGfjzHd73xQ4/uEjzvK7kkscsW1DbSIwVJ
	 2iktWdIVHBI7fsr1PjaFQwdkvLdoEyGswWadGSHC5G86l5anD5gOqRi7fwwg7oTkBIlBu
	 RvyXhaF+9XpdMIysLS7btv8GZBCcAf832XTfZBXqwCTu5ZvWj8tv+oUhq4PdVONC3GCAY
	 QuqZh6UaDUkptwC/DRVZd1RuHBZnyjwSk+cuZd2yNiDx0eOvbBNlx9RtuGF4g+hOMQMaz
	 x7/i/L+rygMa2z7rjjfnk2GLTNno8ovhIzxEC7x27PLxud5I8wWSvWYek1Z4HegfSMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFYKMGWv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SiHhariA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85661606A32A
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85661606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFYKMGWv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SiHhariA
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGDrnk21935803
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T15AuhE31UhCQiNlKm1KpqpzGHM4L5aNNLLLTI73GWU=; b=cFYKMGWvCco0P4Ia
	YGvXIeRz4tpXY7SUeCPNPFk0fOzK34gX/BEUjiEi61jd5nlor/SwMmtSMa49KbIw
	QvAFMXW7g1RwItsuFqNdgLHJJ0xLG6QbgT6ttORYEt0lhG727wHXL5U0SKj8PeDK
	ZxR+FWnkxS8Pg5bM+QcFytSdG7akSpp/Q4rU6huCR8IuP/4p0roE1CVsdu1D94jn
	qIQHYcUZa1hfW+/8FX8MZp/7sI94ei+LVKRjJD49hnTwcbBu38CKM3b0lhx8RWTn
	ppZmkNpSk/B/DPj67Ofgzvb4XsAhGRLqj/r1U0KVUyC2KkWbZsZxcYre6HQeGNxm
	GjQJfg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyrmc2wcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:51:04 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-716e232332aso1507070eaf.0
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 07:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794844264; x=1795449064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T15AuhE31UhCQiNlKm1KpqpzGHM4L5aNNLLLTI73GWU=;
        b=SiHhariASSTdpB3CO3avXtscwp2UguIZP6SgJCk5Fy9RzgwMpu1pYQKuDdwk93eO05
         OgX9Kt3udsboi/AC3TXtxs+dwjgU6MXEatMgNoSTaD9X7KpCuXExEJVrf4Rt2nalUGhO
         +gg17lkz8F4ak3bVe/OzuyVI73a0OFEyIe0kd2lT8MnXZJBeNEHBoz9G8v61Hrm6lC0Y
         sWaWJWHXLI1zCWEWcZDSvQKEM/9FX3eL2dEDi5oQxo9htDdAkWbQuUADelcqWwnqyULI
         OW7swKEu7JWJGyaDbDOs4EF+yJF9wxGHwAxUQmFgDE7IOBFqEDrvciallDq4C3K+vXK5
         Ddlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844264; x=1795449064;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T15AuhE31UhCQiNlKm1KpqpzGHM4L5aNNLLLTI73GWU=;
        b=wB/d4xf48VV6G6G3stC1Vk4pCju6aXBv03+WJYzWb7tew0U6Ge9UijzBbxYWLXozVG
         yNWikKqgW6IUdgBoh2ncP+LJBbU0ui+YOGqPWlCQ3RGBwIdp7+pxkpkmcg4Rm4jl1auU
         qkGDrkhhllSInzSoFPRorDURtwYj5R9F0u8mABsh6h5876p2luazDOCjs92uORwacTeR
         XcS9actq9GuA1i0RfzlZqo7EfzSIzvk8NII9VryCmCB7Nq9EHo+HcYgIsDaq06Gve3Gg
         he40oP9CgmCwpqMmganqRN/i63Gh43/diQL87YPyuvqdZZo6ZQarBLPCeErsbl+dkeAo
         FpgQ==
X-Gm-Message-State: APuU4Z+viMNhycJ096WJ3XKA+udGB5nKmbKo7LRgMXgRN02LpQ1wo1RW
	3qUAekGH3NwJd/XrSEEbJGqM60S+ff+E+zE3IrhEZKTbmvOuF6Ktvp4jh2otRkR8tVOU396mqOt
	lGshso37Q7QEoyPs/sEx4In7IrcIEz2igWis5thiWoW+9L6cxS8BKlqXF5Wc8EKIZR8cCAQ==
X-Gm-Gg: AYBFou0HxifL6khBrv7V+2tSet7gu1c+/mT8BJ8OxwcL4UBK06SvD5Z4DH+Ulg0s+eE
	fk6xjy+StRXJD5IY2zOSPiOSb8La6TT9hLVyVJpJ1kPMnZ5s0E/ta3E26QgH4fgn3mc1QjVciog
	JWL32yz622cJXqpMmuQmEsd+Ftlei20jGpj0QXxDNDOxYEyQBTr4FPmBjgj2Wh9k+at22G613CQ
	1saWSWuqc1uIm8ZrIKXsFk57khNi/6Y02fQHF3s/llz5buRXaAqwYz9UD7NP3FYpzWeXzny5tgK
	dSAeX8Wzd6p4YGsBrf+Efa7TxNBkHsOY5sAeV5ZM/jPISKBiQCxRK//RawrCOFVnEFlhVvpAfPc
	auvP7djb2dJBajE8r9xmxat2Lyeko1d+IWdSrD09LKncAMJjxg3WaEbACXmVwzrClKfYB2UWwln
	2MKZRxNmrxPWhq2wx9FGaV5VVI5Fox
X-Received: by 2002:a05:6820:1504:b0:71a:df61:2e3 with SMTP id 006d021491bc7-71adf61140cmr3798211eaf.30.1794844263447;
        Mon, 16 Nov 2026 07:51:03 -0800 (PST)
X-Received: by 2002:a05:6820:1504:b0:71a:df61:2e3 with SMTP id 006d021491bc7-71adf61140cmr3798193eaf.30.1794844262849;
        Mon, 16 Nov 2026 07:51:02 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42cc12dsm8844447eaf.7.2026.11.16.07.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 07:51:02 -0800 (PST)
Message-ID: <243aa8d2-ca32-4827-8675-70be02b653d9@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 07:51:00 -0800
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
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        christophergriffin05@gmail.com, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
References: <20261114-ath11k-sta-txrate-lock-v1-1-8331a03b1000@gmail.com>
 <a346e622-8fe9-4912-9ded-b531b1bdc82e@oss.qualcomm.com>
 <f7ecb009-4c95-4ef2-b569-3b2069298c41@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f7ecb009-4c95-4ef2-b569-3b2069298c41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2MyBTYWx0ZWRfXwCgtIdGdd4X5
 2zpjciDdSyZFDAsIfAFqp5PMBpLwJxxLUj2OhZoIUK9cfuTN867/ICLi0oR9rRoNwX0YvYGH6b0
 5DPjEuxcXGLqpvKVJug+FtvP0nTHuVE=
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afb2668 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=VJsjqyxQDCAMHoR8YxEA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: OypvMifIJhAhlLVAVVJa5s6KOmK3hHfl
X-Proofpoint-GUID: OypvMifIJhAhlLVAVVJa5s6KOmK3hHfl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2MyBTYWx0ZWRfX26TpSsZZ/QgQ
 1UwvwPpnRw1+0ML+fiu4jAB13yvt3gqExYKY1TmHearGGwzowAqsgVMdKOQDhYtGEfZPWWw5Kio
 OvbDSZ4BffopV5bbltwfLCQ/LTiJSDv/WMFiC/lQTTW+U58oQC4mFBBsbMYXmGWAHlGYtHQ+kHr
 GgLvI8Kgtdl6m62iraqX7Uz/OC2WE32pEjipkI3p14Du5ihCucKhlOMpk2ErZeCiUxuHFjP7zqv
 cj6dnHhe8t4vYevUNjVaCdby0CO0QgiQk26/nHK/tA1aj5XmpcXZPzGqyzlNQe6HVi+phEsi09V
 RnUpZOo01Jstd/TESGyC17ABYLLQ9Ohm+NYUnmTLL4fKeV3HjkmnrxXmeQ0SghBCuQyltOyInzZ
 y7NrlnUESMfjM7ynKetrzKphiELswvy3q+FRtPL/nuH+8Wlg7zAgXA5GzxGWtaJYPB/IoG11NnV
 T4diwij9xWqFdKFmzdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160063

On 11/16/2026 7:00 AM, Jeff Johnson wrote:
> On 11/15/2026 7:03 PM, Baochen Qiang wrote:
>>
>>
>> On 11/14/2026 10:34 PM, Christopher Griffin via B4 Relay wrote:
>>> From: Christopher Griffin <christophergriffin05@gmail.com>
>>>
>>> ath11k_update_per_peer_tx_stats() and ath11k_dp_tx_update_txcompl()
>>> rewrite arsta->txrate under ab->base_lock: they clear it, then fill in
>>> its fields one by one. ath11k_mac_op_sta_statistics() copies it into the
>>> station info without that lock, so a station dump that runs while a TX
>>> status updates the rate can copy the HE flag with an nss of 0, and
>>> cfg80211 warns:
>>>
>>>   WARNING: CPU: 3 PID: 30429 at net/wireless/util.c:1581 ieee80211_get_vht_max_nss+0x474/0x868 [cfg80211]
>>>   Call trace:
>>>    ieee80211_get_vht_max_nss+0x474/0x868 [cfg80211] (P)
>>>    cfg80211_calculate_bitrate+0x1e0/0x4f4 [cfg80211]
>>>    nl80211_put_sta_rate+0x50/0x1230 [cfg80211]
>>>    nl80211_put_sta_rate+0xa30/0x1230 [cfg80211]
>>>    nl80211_dump_station+0x4b8/0x7e0 [cfg80211]
>>>
>>> (the line is the nss check in the inlined
>>> cfg80211_calculate_bitrate_he()). It was seen once in about a day on an
>>> IPQ8074 AP whose stations are dumped periodically by a monitoring agent.
>>>
>>> Copy the rate under base_lock and report from the copy, as ath12k reads
>>> its peer rate info under its DP lock.
>>>
>>> The change and this message were written with Claude, an AI coding
>>> assistant.
>>>
>>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
>>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.r4-00683-QCAHKSWPL_SILICONZ-1
>>> Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.5.0.1-03982-QCAHKSWPL_SILICONZ-3
>>>
>>> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
>>> Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
>>> ---
>>> Found on an Arista C-360 (IPQ8074 + QCN9074) running OpenWrt, from a
>>> warning in its kernel log; the cause was found by reading the code.
>>> ath12k already reads its peer rate info under its DP lock.
>>> ---
>>>  drivers/net/wireless/ath/ath11k/mac.c | 26 ++++++++++++++++----------
>>>  1 file changed, 16 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
>>> index 1a237adaa37d1..d76eeb1ca0019 100644
>>> --- a/drivers/net/wireless/ath/ath11k/mac.c
>>> +++ b/drivers/net/wireless/ath/ath11k/mac.c
>>> @@ -9425,6 +9425,7 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>>>  {
>>>  	struct ath11k_sta *arsta = ath11k_sta_to_arsta(sta);
>>>  	struct ath11k *ar = arsta->arvif->ar;
>>> +	struct rate_info txrate;
>>>  	s8 signal;
>>>  	bool db2dbm = test_bit(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT,
>>>  			       ar->ab->wmi_ab.svc_map);
>>> @@ -9435,18 +9436,23 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>>>  	sinfo->tx_duration = arsta->tx_duration;
>>
>> arsta->rx_duration and arsta->tx_duration are u64 and are also only updated under
>> ab->base_lock, so on 32-bit they can tear the same way. Since the lock is taken here
>> anyway, moving those two reads into the same critical section would cost nothing, and is what
>> ath12k_mac_op_link_sta_statistics() does under dp_lock.
>>
>> Not a blocker, fine to leave it for a separate patch.
> 
> I'll incorporate this suggestion into the patch in my pending branch

Please check:

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=9d8c2294a34e5ec38b674a8a1a5223522cfe3842
