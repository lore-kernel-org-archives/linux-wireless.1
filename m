Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795676724;
	b=pEQlBJyqObMk1IPfWJyiAt5EN7YdEdhTZWcEP1Rt/JB0PJOkcNLc+Lguv7aDMu8PbpRU
	 hx21fajkbk+vRo9Yh1icgO/qsrgb7DV5rnPahRWvpEMvTBoJQqWnLkNsU49gD2WWohXp+
	 RJ8gcesma+I++Az2E7YMoQgfeCwr2o6HtxTmF+l/OND0+05ZTXL8pDxdije4LiP4uWD8c
	 uI7NVvjlUK1+ycPZrq2gY4zhWdi5JYs4Yh9xsfLhtEHFLR6CDHU5RTetYT8S7Vx+mAmRF
	 SRfhtcTVluN+HGn0bYArQsEvFwtvDW9Kq3HND646mY11TeXuHcFpne1pQwCwe3LjqPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676724;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bdx7UpabDWwudSHqUP7nL1DuePy6rsFlxcZipCI63Tw=;
	b=PZGiuuYl4vbMYa8Al1V0LwsPFfT6JZivO7JlEap68V3urornfU/yv/zNDdMo/2bAkhoT
	 zrU1722UiAwbNh0FHP0ARganx06XQlBWutdtEuF2QfZOIdS/Ck15c/mPKVDSM2qaMQLRh
	 8oTMtqgb1OWkRjxVym5pPbt62LYRx+oj7UZDRTMGAeQgIGfCfa3m8pkudYj/cN4+dZdyA
	 hSkHo+Cl+mQ0ORplTz85wBh9/TB5sSuKuji+nYaTiH1KPrboJi2x9sbI/8bf99GihjAtZ
	 m/sHNo64yDFShRrxhYVcDjiQdIGl9fO6dSuKM4Hgv4ruuXYR3F8rvTOYg8RJd3pasaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SfxZnJwX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RxwxjM82;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BD1606A31E
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 07:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30BD1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SfxZnJwX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RxwxjM82
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36YAP2791304
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 07:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bdx7UpabDWwudSHqUP7nL1DuePy6rsFlxcZipCI63Tw=; b=SfxZnJwXGrwhNTWt
	6E1PcOPbFWlJN5+VhVOtIC+U8qq3OtacG67E5sVGrFA0PCObYHOkoklBl0gIm5uk
	kp7vWHCGRb5pXcQktvNG3g7oCugN4STy0GPSeRmz6z+Z9zR1pq47zrIXnVGuFWsa
	/tumpI+/NfDlbmNQAT5JBYLTFpy0R3/xd4WEXkC7Eh9BJBR3386FvNi35DbAfjK6
	E19PnmCndJEykOakP7c9rqtny7SkJa7vlYQIpsRzodrsFpQn3nNYm0wkIszzDmiN
	f1T4JGUPkvEqdWD19Y299iIsaYCKaOtFuQdjZAzAzvaCXg/WWEzRAdvttVAemez9
	qZVulg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnvasx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 07:05:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f0e3ffabe0so12060895ad.0
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 23:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795676721; x=1796281521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bdx7UpabDWwudSHqUP7nL1DuePy6rsFlxcZipCI63Tw=;
        b=RxwxjM82pYWqNPepd4n1TPnbOOabNzW9iJSq9hX5pJn7Q4ydojLGaRLl5MaYsLRovw
         D8HrorbyVwna1GQusix9X8Ij/8nZXZKe7SqIVsyCdqBZsSOdNPNYqB7gyVOiStomVRXJ
         WPfKX9FbhtvzxG5XIIEq+wEVzDLBSxSMxicmkpe6PEowcMNl5k0/VzUmEi74hbnXxWgl
         mPPuT+dk7zrMudZwccBuN2UaZxaGYbERDWa/bpHzGZOM1fcl6rQ7fzCjk5w6vZHg/5pM
         RlDQlHlqcYLOOKvQzxtB0JKO3Xe6w1rIDHiOSWZP884UITjHHBszx7RNJUkB6uMtoR1W
         WcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676721; x=1796281521;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bdx7UpabDWwudSHqUP7nL1DuePy6rsFlxcZipCI63Tw=;
        b=wb1AwekDMMKQdH3i4VCIVHC6titkXqKk0SlsI4vf/Jro0ItUVPbkcXFhtfscRuYcRg
         iY9tflwi8qcSFAfd0q156LegCWoQ0K3GxWevGSmG9mbJrfTozDUHMRnKw0pcfCV6/hHC
         nasGKd55pxpaehnb+OqRoCmjibUnt34+eq8SidVfQ6JrrkJb+/A7329QNU6/sZYahNQv
         w47wJ+KtdV1Qc+SKWiZyZHQrXk+nT6u0UQjAgmTHGJtD0hvHkpgyxlPQMcfW3oSUbBQn
         SlERYIK4pejVe5mWj+Uabl1QpyfHGgiVEWO4/DcWa6ghyTwOUjGj+qvqV3FKNUT5iMFJ
         y8Zg==
X-Forwarded-Encrypted: i=1; AL+hErH7dL0Q6PqbMS+Cs5xJLSGtyfTJIB1BtGoPWmGDpUVxRFud2NDr3k3YYU8Fdm+SaBwwpeN1PEP71TTTPrFU2A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/NS+c7hOAfIosDy2QzJ8lQERnzlLNokl5OiXBJEhQVNTapXqA7
	iFRK5RW1E7gpCfadPU9qLf82CBnddeDRCx7iEoJo3JDuR/1+pK3npJC7yxyhbQ4pARlAfitW+De
	2bQsL0YLUqk3KdtE6rjp0Y2DWnyPpH3v4SwW2lYhRyoNHJiOsIpLE95UrT7ypOygcEdbPcg==
X-Gm-Gg: AZFdTZdlol7UnLiLBy3xpp4uhNdIzmmxKTWohBPIeClebBn0m2KrAcFj/5zzz5JajFJ
	jsIq9cGuGkx9zJotc241qbVvk04AJlEBoSs/6pneQWlsK3BWhb7atZcbZQfCjobzEf2mwIWAHyB
	IJXireABXf9HwIPuDo5U6XJZQ/NhAuKROaE4nW025U60OUHYjPuwS1HrOpDzleKqEVMmgiZrN1S
	url31C787nirx5mflLEp+JAabYrHS210+Zy8CIqQgS2uQLReC689dAruW4ha0Ojsm5OrwUYBSHh
	1ObRk6NXzxJFsoFnmDlgoOOm3kvTnuwgp3M+4YikY70gvJr8PiiLRZVa/90mDfjPtPWBhGh1wb8
	/RqHnpRkvIZ3E8HRBili5lK6bv3zMqMEy7FpA1HGFy+xxWUNcuyyHT/HjvoLGTt8UBiKpQAOcf3
	hwAVsFlSGIWSOhndcziyXlQDqqk/HY2kxzhUmYUQFwbg==
X-Received: by 2002:a17:903:2282:b0:2f0:82df:b8a6 with SMTP id d9443c01a7336-2f082dfbfa2mr135854165ad.59.1795676720766;
        Wed, 25 Nov 2026 23:05:20 -0800 (PST)
X-Received: by 2002:a17:903:2282:b0:2f0:82df:b8a6 with SMTP id d9443c01a7336-2f082dfbfa2mr135853805ad.59.1795676720167;
        Wed, 25 Nov 2026 23:05:20 -0800 (PST)
Received: from [10.133.33.167] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0bc695f31sm41415355ad.49.2026.11.25.23.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:05:19 -0800 (PST)
Message-ID: <7e396e37-d70b-4091-8764-f416b1ddc7aa@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:05:16 +0800
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
Subject: Re: [PATCH ath-next v4 03/10] wifi: ath10k: wake blocked waiters when
 entering WEDGED state
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
 <20261120-recovery-v4-v4-3-53d6a04490e0@oss.qualcomm.com>
 <CAFEp6-2pecH+PxiDv+VpCfUyQabGSDWitHPbxpAv57fWTiP=mA@mail.gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2pecH+PxiDv+VpCfUyQabGSDWitHPbxpAv57fWTiP=mA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNiBTYWx0ZWRfX6q0+3bQVwKjH
 JA8tUuzEgxUUd8NMS4q/1kK34aI5SwiI267mgo/65MQhcyP8MZhR/ree72M8ZAkAIGLvn5tqpjT
 9W+q7rkr+EG0tr5EV6dcWkj2PtDUkIpRFYu2HVjsiAwYpytEMOwJY//ImJI7oraiaCIqCesNwdS
 /9svXjM5sKOObxoT2TL1nyxHSzoc777XQ8XvGnpw7Mfwfz7vb3x3aWe4IDyJFt+6CYhv7GE0PYn
 5Rs1at2isMyQrrXwPEfr0ZFLSFHWmJ6FQ/AZ6Mk9iTQXMO0vhzbDT5TI66vpKoHbEZv38TM1Q/3
 CyvEt21P4aeBBWZmKXr9EGNg8hRJaa3jbzMhUUcBGt0pCA6bvNT+33+KIonrGkjzzGuIVL0GmoZ
 DPuFB626KCND7imHnSxav5b+G/N/AXF/SfYQqQyvNMRoauOtC8ymvdr1Id+HewDmDwbLN6mmHx8
 g+B2EjRDhjxsjl1GiHA==
X-Proofpoint-ORIG-GUID: gkUP-fViLO8DipKBZpt0ivjv4dV6ev9M
X-Proofpoint-GUID: gkUP-fViLO8DipKBZpt0ivjv4dV6ev9M
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNiBTYWx0ZWRfX9n540TbK8TVr
 pqoScjcs7AyM8Jvw4Gkp++maKxN5qe0Cl7lwhD0Sh4NPTrtHUPvd1/i3vlBb2ClJGtJbWt8G3KP
 xI5lcshHw4S7A3HV2Pd7KYMYhDZtdHU=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b07da31 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4gwAILDwourXv-2xtFAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260026



On 11/25/2026 6:29 PM, Loic Poulain wrote:
> On Fri, Nov 20, 2026 at 9:42 AM Kang Yang <kang.yang@oss.qualcomm.com> wrote:
>>
>> Commit c256a94d1b1b ("wifi: ath10k: shutdown driver when
>> hardware is unreliable") added a fail-count based transition
>> to ATH10K_STATE_WEDGED after repeated recovery failures.
>>
>> When recovery starts, ath10k_core_restart() sets
>> ATH10K_FLAG_CRASH_FLUSH and wakes waiters already blocked at
>> the time the failure is detected. However, additional waits
>> may be created later while the recovery attempt is still in
>> progress.
>>
>> If recovery ultimately fails and the device transitions to
>> ATH10K_STATE_WEDGED, those later waiters continue sleeping
>> until their individual timeouts expire even though no further
>> progress is possible.
>>
>> On suspend/resume, these extra wait timeouts consume watchdog
>> budget. Crash logs show cases where one or two such timeouts
>> are enough to cause the suspend watchdog to fire before the
>> driver finishes shutting down.
>>
>> Apply the same CRASH_FLUSH, queue-stop and waiter wakeup
>> handling when entering ATH10K_STATE_WEDGED so blocked callers
>> fail immediately once the driver gives up.
>>
>> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
>> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>>
>> Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
>> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath10k/core.c | 43 +++++++++++++++++++++++-----------
>>   1 file changed, 29 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
>> index b536c21630b1..3bb4d2742c30 100644
>> --- a/drivers/net/wireless/ath/ath10k/core.c
>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>> @@ -2533,6 +2533,32 @@ static int ath10k_init_hw_params(struct ath10k *ar)
>>          return 0;
>>   }
>>
>> +static void ath10k_core_wake_all_waiters(struct ath10k *ar)
>> +{
>> +       complete(&ar->scan.started);
>> +       complete(&ar->scan.completed);
>> +       complete(&ar->scan.on_channel);
>> +       complete(&ar->offchan_tx_completed);
>> +       complete(&ar->install_key_done);
>> +       complete(&ar->vdev_setup_done);
>> +       complete(&ar->vdev_delete_done);
>> +       complete(&ar->thermal.wmi_sync);
>> +       complete(&ar->bss_survey_done);
>> +       wake_up(&ar->htt.empty_tx_wq);
>> +       wake_up(&ar->wmi.tx_credits_wq);
>> +       wake_up(&ar->peer_mapping_wq);
>> +}
>> +
>> +static void ath10k_core_enter_wedged(struct ath10k *ar)
>> +{
>> +       ar->state = ATH10K_STATE_WEDGED;
>> +
>> +       set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
>> +
>> +       ieee80211_stop_queues(ar->hw);
>> +       ath10k_core_wake_all_waiters(ar);
>> +}
>> +
>>   static void ath10k_core_recovery_check_work(struct work_struct *work)
>>   {
>>          struct ath10k *ar = container_of(work, struct ath10k,
>> @@ -2551,7 +2577,7 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
>>
>>          ath10k_err(ar, "recovery did not complete in %u ms, will shutdown driver!\n",
>>                     jiffies_to_msecs(ATH10K_RECOVERY_TIMEOUT_HZ));
>> -       ar->state = ATH10K_STATE_WEDGED;
>> +       ath10k_core_enter_wedged(ar);
>>   }
>>
>>   void ath10k_core_start_recovery(struct ath10k *ar)
>> @@ -2618,18 +2644,7 @@ static void ath10k_core_restart(struct work_struct *work)
>>
>>          ieee80211_stop_queues(ar->hw);
>>          ath10k_drain_tx(ar);
>> -       complete(&ar->scan.started);
>> -       complete(&ar->scan.completed);
>> -       complete(&ar->scan.on_channel);
>> -       complete(&ar->offchan_tx_completed);
>> -       complete(&ar->install_key_done);
>> -       complete(&ar->vdev_setup_done);
>> -       complete(&ar->vdev_delete_done);
>> -       complete(&ar->thermal.wmi_sync);
>> -       complete(&ar->bss_survey_done);
>> -       wake_up(&ar->htt.empty_tx_wq);
>> -       wake_up(&ar->wmi.tx_credits_wq);
>> -       wake_up(&ar->peer_mapping_wq);
>> +       ath10k_core_wake_all_waiters(ar);
>>
>>          /* TODO: We can have one instance of cancelling coverage_class_work by
>>           * moving it to ath10k_halt(), so that both stop() and restart() would
>> @@ -2664,7 +2679,7 @@ static void ath10k_core_restart(struct work_struct *work)
>>                  /* hw restart might be requested from multiple places */
>>                  break;
>>          case ATH10K_STATE_RESTARTED:
>> -               ar->state = ATH10K_STATE_WEDGED;
>> +               ath10k_core_enter_wedged(ar);
> 
> ath10k_core_enter_wedged call ieee80211_stop_queues(), which is also
> called earlier in this function, is it expected and harmless?


mac80211 will make this harmless:
static void __ieee80211_stop_queue(struct ieee80211_hw *hw, int queue,
				   enum queue_stop_reason reason,
				   bool refcounted)
{
	struct ieee80211_local *local = hw_to_local(hw);

	if (WARN_ON(queue >= hw->queues))
		return;

	if (!refcounted)   // refcounted=false
		local->q_stop_reasons[queue][reason] = 1;
	else
		local->q_stop_reasons[queue][reason]++;

	trace_stop_queue(local, queue, reason,
			 local->q_stop_reasons[queue][reason]);

	set_bit(reason, &local->queue_stop_reasons[queue]);
}




> 
>>                  fallthrough;
>>          case ATH10K_STATE_WEDGED:
>>                  ath10k_warn(ar, "device is wedged, will not restart\n");
>>
>> --
>> 2.34.1
>>

