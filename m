Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795676848;
	b=kcYMDb7mS74DrIJt/BdIu5EYlMr1RVpZMme9Xp5yU7xd15yy3aZN8LCEN+M6wPF+GNU2
	 ACXS3+BNNF96qCObUaWADcP8gUcOdmK1ejS0Ah48ICsSGl1QK921KRXtt8qHTFKjobWBP
	 cbzwhf7trEFoJnFLPG7nR2cZbZK6heTCA1wJk/BcGYtZDPkZgPh2GGpqH5QyJfG1fxcV+
	 2Sls34HWfV5uHwZJBiHnk0Nhhx/m987Soq4hdRDFL5lptiNlf24xNjmstTWjrP7EwI/t4
	 nvFQI9aeV36pF5BYy3sFuFxiOlVWRp8yXimmZ00Yvvdy4YQ4XTJtngepLdpN/8+ldhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676848;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TWtJ7O/weMJzv9paex9qV3Mx7PBaOy4zcuYq1hMdYAs=;
	b=ACRQlepQfsObIQF1m1MP17/DH4w/I1ONStsseHBVekxiCLE1bkjYckVrZzGMBHYxpsmu
	 6YHsMcNhjZiDjQBDwwmrXwMc6Y3bQ3s4cPcwcSnzwifEs3WT8sleXAj9kyaoHba5BDz/f
	 OWvoLuYq0jdtcXoKkwc7xhbPQyFobJ+WfqyuxgXxWeYnQboXY8NHPC/J4VJ2p+0ZzE4uZ
	 mEqdL5dqLWmTGEe4YLxSc7wG1e7KemFGqvlGCBiw9gKEvIVwTnnQOx/7h4gR7kV2xKD1j
	 t8/MU4OahnaYRRu1Inv+dVzVD3ulAxy3/udOGEE6vjFuuddSnNKNtr2Hj+b8wbQ05vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jrfsm567;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HvF7LmQm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5FF606A31E
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 07:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF5FF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jrfsm567;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HvF7LmQm
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36RFV1686573
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 07:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TWtJ7O/weMJzv9paex9qV3Mx7PBaOy4zcuYq1hMdYAs=; b=Jrfsm567H+fdNQx/
	lUrkwcVjzdUrijpNhqPBmsVygEcSaJbtAM8e17cIJ/6hbA5vxUDhBMOJicf71FKy
	rx/ordM1e4mpsCuEKID5GZfvz2yxTLeC5FdQC2TtqHRbRhzSiKBasS3OtKBLgPUa
	TC4wFCV32pawJDR4aUVKhhqZ9VvSbNY7glW4uUM3VL/ixMVVTFm9J3Hue+oyPcyL
	tzFkxd1yULQnEp8klV/v0ldTDhSlSOzkLSoEB9kZjR9YLXPjZ7wweSyA1G4vpeAI
	eODYU1JjGEhWpnHNYneeWogKZ3HPatKY0mpgm73BXznZw/z/0U8MLzoF/5vb+MQS
	oyVMDA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qf9qwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 07:07:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a05a4396d2so5289710b3a.0
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 23:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795676845; x=1796281645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TWtJ7O/weMJzv9paex9qV3Mx7PBaOy4zcuYq1hMdYAs=;
        b=HvF7LmQmiFbM21vF6ldNAGPedf43Gjp/K0lv03VxeWYq8UN6VglxtvFzVPgWHPscS7
         IFIG7cQpq6yfFydmAWaAfx5Oo7xuXFgMLeyuWNiuBAmiqrs9SZEDy4zNFgOmlOp3QAEk
         sQS6pY5Y+wVUyla4E2/ICXDFzimyRNR5pW/KAo6A89IVpNUGHcL/UhuGz+W8JvcI9dvS
         VhsT/EunCGFo95hayLcBa96HA9Fag/8SX8KtbWnPxYGVwK8oh4aoAmR2luv80WbpuWRf
         SZ23AUkMc/615FqmXbFt68nYs6IhySxzOLX0gS/l2AaNPUPyJASnRzyhc2SlbcOwIhS6
         kgxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676845; x=1796281645;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TWtJ7O/weMJzv9paex9qV3Mx7PBaOy4zcuYq1hMdYAs=;
        b=y3H7p0xksAL2DUPCtvu5id5u4C5g/7Rawj9eK+qFpnEA/chz8UL51xwZjXSDoPYTs0
         UIPLaBg81NJG6gYfMIOl8zvL2K8P4zOo3wHmSFL52k7bd9FLht8xL5pMg2DHwKmUT5au
         s0EsBnyVsKuZdMDd3oW+nmYVGuBXEpksZ+Rmaciber8mJz77EnbtC8zh2nrvwUdeLUtl
         /mGHBMP5CMMAwgz6is0lSuAz3KJ8+Y28EbM8NlBEKRjBAJ26tlbVTrEE6sh0cFqTzO0z
         jxejJYmMghCW5bpMAG/aiYXAQ7qxj1fbZIV/wVxUahvqGfu+wuzFR+tQyNXZTHKEx+WC
         ZqcA==
X-Forwarded-Encrypted: i=1; AL+hErEhwYUWcVcAlGtLNhzFnFTs+fA+L5KZaZk8i0nSWCP6RJxNqaisfNgMe4Osuvfj2GNhI41+WXiDumk9kRLZXw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Th2dZZ+zJOCQRAuuXhDJcT3H+vuks1J17ArpHdsXussADAoeE
	syNE4fbRbd3p+FSvVux+RCyUJXONiHwkI2ePRns8rfwcg+u44Wd4OFMIcO3I6WMQeelhr74LZD6
	hKQJOHiLnIW+F3TqfZXXVH9mVe910OGfJLpmp/DRBGhcP1GY8ZYts0EXmXf6gaoI/L7QoZA==
X-Gm-Gg: AZFdTZcDjkGzdyKTeCKDuH+zkpRUH+1TdRkpj+O+d3ZBCkx1iWxNaRXks9ikUhL9FhC
	Yyb0H3pxjxaFDiAZJvEvH741JoFLLHvAQjf7BKxmOEIZVTh/Cb0Ap8UkZQZOH2Fr9ke2IVvlsxP
	bz9LhE+cAUsxxjHaoksdUxNumL7wn6IBsPKea0/INztJJ1Ts4afbQayA2P0yHmCQdxV4OBGJXfM
	Dx6e4LT1J1SJAeuzyiGNjVeCJhwh6miv4eS09iMm1G19zJxpw20nOMJRiUBvnuGZK/vxVimPJWg
	ok8ZkdyHbVmHgf1mrwhubqhygMiBQPYmTpngsG8KI3SLMNWMqC8L9YqYNiQscY3lX8XIW8QXdyq
	sTowDC4hEn89/gkt0D+BHnJqgIBxUyG/cS9OmwEaqmTTirivhVQ1grZMZYEI6UMwZNV5gNTQq6K
	Ozd5wGrBb5Ed0s2oudbv5Qs3hrlaoMFGSvOWpqIMFH
X-Received: by 2002:a05:6a00:2d14:b0:8b6:400d:7cc9 with SMTP id d2e1a72fcca58-8c87c671eabmr19440909b3a.29.1795676844669;
        Wed, 25 Nov 2026 23:07:24 -0800 (PST)
X-Received: by 2002:a05:6a00:2d14:b0:8b6:400d:7cc9 with SMTP id d2e1a72fcca58-8c87c671eabmr19440878b3a.29.1795676844204;
        Wed, 25 Nov 2026 23:07:24 -0800 (PST)
Received: from [10.133.33.167] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c05fsm10329081b3a.17.2026.11.25.23.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:07:23 -0800 (PST)
Message-ID: <0bf83f69-f069-444b-a45f-b4582b544405@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:07:20 +0800
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
Subject: Re: [PATCH ath-next v4 04/10] wifi: ath10k: also wake remaining
 blocked waiters
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
 <20261120-recovery-v4-v4-4-53d6a04490e0@oss.qualcomm.com>
 <CAFEp6-3zK1=Fsrkmtmuq7Q3xnNMuCE1R0J8Pe-rAJun9igCcJg@mail.gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <CAFEp6-3zK1=Fsrkmtmuq7Q3xnNMuCE1R0J8Pe-rAJun9igCcJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: m9HAiLQB3yQLaMgziac3j7JzR4R4LD1u
X-Proofpoint-GUID: m9HAiLQB3yQLaMgziac3j7JzR4R4LD1u
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfXwHHmNYdl81S7
 PJZsnnIuDtPoN7VZSmX8sBmIFlSVxGY4mR4dznRFikBMTBoGgJWcbGPvoDaHjIhMUOFdgBOMjZf
 GKQCzoZdsItiegrRf9o8F/BMTMcs1As=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfX860VxosAkZQu
 HaxpVFJo+PhhCaCpaV/u3UIzdfydGgGRNTJv/o9h5TxOdlYOQWB7s08pTfLjBo9SUfzngf8c9nh
 VYG7gTwhtv+K7q0ab6qeBWJWqkdW0pfwY56Bgj6hsHPLYMEdbIAgEKJAA7xR5JXbU9mn//yAykd
 c5SCn1ABAo+oqkeJxBXgwRKXbhp1BXxjEkJKfI4daQSeetal6g8anS3jc9L7ROC3FpHg7izjg52
 jbaB93+3n1Dw0Li/3EbX3IcAw4MHLS5rjPDcSnSHL2U6hLqkPLss6r6sk76grqTuOr/N9IJUm/m
 HAroZLBTEoIbATQUn2viIQlJZOH+duqnsKVxjpQa1cdMIpqtW1QXza5KlBSsYq1lHOZe3gmOK1O
 4qasg/ki2SpRXPMGlTy1VI/aRx2yKFUAR7S8UQMiqcX7OfipfMf5R/sju52X+E141nAI0Z4AXaC
 Ax6LaSCpoBv7EwU7j7A==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b07daad cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=468j3veBC24j7YoULXoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260027



On 11/25/2026 6:35 PM, Loic Poulain wrote:
> On Fri, Nov 20, 2026 at 9:42 AM Kang Yang <kang.yang@oss.qualcomm.com> wrote:
>>
>> ath10k_core_wake_all_waiters() still misses several completions,
>> leaving their callers blocked after the driver has given up on the
>> device.
>>
>> In particular, callers waiting on peer_delete_done, target_suspend,
>> wow.wakeup_completed, peer_stats_info_complete or wmi.radar_confirm
>> continue sleeping until their individual timeouts expire even though
>> no further progress is possible. The WoW and suspend waits are on the
>> suspend and resume paths, where these delays consume watchdog budget.
>>
>> Add the missing completions to ath10k_core_wake_all_waiters() so the
>> callers are released immediately.
>>
>> peer_delete_done is not otherwise reinitialized before every wait.
>> A completion left signaled by recovery would therefore make a later
>> peer-delete wait return immediately. Reinitialize it before sending
>> each peer-delete command.
>>
>> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
>> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>>
>> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath10k/core.c | 5 +++++
>>   drivers/net/wireless/ath/ath10k/mac.c  | 3 +++
>>   2 files changed, 8 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
>> index 3bb4d2742c30..99960f12dc66 100644
>> --- a/drivers/net/wireless/ath/ath10k/core.c
>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>> @@ -2542,7 +2542,12 @@ static void ath10k_core_wake_all_waiters(struct ath10k *ar)
>>          complete(&ar->install_key_done);
>>          complete(&ar->vdev_setup_done);
>>          complete(&ar->vdev_delete_done);
>> +       complete(&ar->peer_delete_done);
>> +       complete(&ar->target_suspend);
>> +       complete(&ar->wow.wakeup_completed);
>> +       complete(&ar->peer_stats_info_complete);
>>          complete(&ar->thermal.wmi_sync);
>> +       complete(&ar->wmi.radar_confirm);
>>          complete(&ar->bss_survey_done);
>>          wake_up(&ar->htt.empty_tx_wq);
>>          wake_up(&ar->wmi.tx_credits_wq);
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
>> index 74aca0af11c8..695df1821e5c 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -843,6 +843,7 @@ static int ath10k_peer_delete(struct ath10k *ar, u32 vdev_id, const u8 *addr)
>>
>>          lockdep_assert_held(&ar->conf_mutex);
>>
>> +       reinit_completion(&ar->peer_delete_done);
>>          ret = ath10k_wmi_peer_delete(ar, vdev_id, addr);
>>          if (ret)
>>                  return ret;
>> @@ -5897,6 +5898,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
>>   err_peer_delete:
>>          if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
>>              arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
>> +               reinit_completion(&ar->peer_delete_done);
>>                  ath10k_wmi_peer_delete(ar, arvif->vdev_id, vif->addr);
>>                  ath10k_wait_for_peer_delete_done(ar, arvif->vdev_id,
>>                                                   vif->addr);
>> @@ -5959,6 +5961,7 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
>>
>>          if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
>>              arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
>> +               reinit_completion(&ar->peer_delete_done);
>>                  ret = ath10k_wmi_peer_delete(arvif->ar, arvif->vdev_id,
>>                                               vif->addr);
> 
> So it would probably be cleaner to have a helper such as
> __ath10k_peer_delete() that performs both the reinit_completion() and
> the ath10k_wmi_peer_delete() call. Avoiding duplication.


Will change in next serion


> 
>>                  if (ret)
>>
>> --
>> 2.34.1
>>

