Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795156931;
	b=gAjuDctXjVe3tOQopwKb7gS6QSbzINgYHC0eXV6S1tY3GGa+XH0zQZGVST5eeUo9495i
	 hRO+DhDzbYX1egLG0czPk9/UUAUt4QmmY4NF6TgpfbIxmh5VypQMmy3NoGkUYCg1JlKzQ
	 uzVcn8t9UpwjrPWFQm5qmvUTHx7wDUs5/3xvnl04kO9PbfyJxbLGfJ72Wwc/MrAtu4vVl
	 UEOkbJT+JOUxr5zchZICr6LODqNFxcdPoKImmrP+Hi5Ra8b2UF8L9AvJ7LPU8xT+rDGXO
	 BoVI3szBxvVM5BgcZZIluj8cHuaN6sWCPWClYqs2VHuZm7+3IeRrHvpvTe8S/GfYK2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156931;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Z04Zgh/4uhXTKGuLDOYJatyR674dYRllSpwpdbHQSzQ=;
	b=V5ZxftT2cbmRy6yAY+g6PIUkFsfegaEKHuGo+Z4EpcOhJSuHY0JCp9SK3wxCJp48nD3l
	 oVo2ROqJqFB8OrMoLtBSqhDoni9TwQ2AxqpQA2e4e50USyVT6XnGlYXwQC1Ex0ce7W+Fa
	 MbGa9prw1iqz2NC2FNdnmboIVDb+YogwP4/w4eutVVSPn3iLmmfM1O0blHcWmzuDV2/wX
	 HOR72ZRomwvn/QsU3wsrdkvM+NTkcgLrxmValZC8nBmyPrt6CNeFZUlwe+pnaZ+fIPmEU
	 VZ6Egj8kBaJqMnQ1+dyUXpOpkA/CIzZkN/jBek+kHVGjjFRYq9IyHINhAdGq/OL3i2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ELCm7CSA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UUNMFQSw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7D4606A337
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 06:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F7D4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ELCm7CSA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UUNMFQSw
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK4qWmU1643063
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 06:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z04Zgh/4uhXTKGuLDOYJatyR674dYRllSpwpdbHQSzQ=; b=ELCm7CSAXr8TgCGi
	8ZMvThZeoeM2fX7FKd/PpSYl/M+69+mJLFzfD7xJ1I/nypIv5+3Wb/1ZP11yN8vp
	sgZkNhg8YFyxzG6fppr/hrMnkK2WdsBlzNZ1eSrqTMV8iHZ27tAPbjcwO+1qe6kL
	3m4ncvaz3K4JPJCPQq6CAynCMnBvD5uO18RozYMyWUiskCtSNkWdtIT7FQIUfgAz
	+N0kVdKf4J2rW0ZOV5326jX0T3bND1Q+BcakBn+PjhoJwK8exWOkfKvPn+kbHQmO
	V/vO2EiurYVl63XaxrkIeB+S6ULSKC910iMlE7WGSCiPNXPI+3I7tXqVizC9Z6Zx
	KYXW/w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj8dgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 06:42:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2efda2c6605so3695665ad.2
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 22:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795156929; x=1795761729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z04Zgh/4uhXTKGuLDOYJatyR674dYRllSpwpdbHQSzQ=;
        b=UUNMFQSwc4obBsowlwlEt21XxSADSHaxBo5iLCn2seSW/SSvBe+hG3bGuN2x3JO0hl
         MmkpI1MG7vxiu0NOZKOw3i6tjDCP2cEMyCqR6jiiKhbSvwJvCpfMDLHz8l+S/7FbTslq
         +eNtnYDkNs+9POIwdYFmVMxaGLaO1tog2OJoLaZ29cXd/5RtVURkCzZyNrz2DiJKlMzj
         Krak8oxgkgpuy6fOG/J15cjj06dUHPhncZra2/6slGL4xGNby5UG2bX2x1yty/1P44Ie
         5HskdRox2UPw3ywjuorbboe7gINxaDlA+M1P1U1c6ZXuBNzgLBJeAm2/TT1x36gzczAc
         WMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795156929; x=1795761729;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z04Zgh/4uhXTKGuLDOYJatyR674dYRllSpwpdbHQSzQ=;
        b=jsDA9VlRS4AdVpLm978Uvs9XILAIoqk9/ZlRjHefkRVQih+41b2OZUQfDs7m8hPJt/
         YDp02HQ9hFZmnkF3fppTEJjsocWoJ25NimIaUH5tGkOvM3EV6yCfjifPUQfzuY1D8j/F
         No1Otl8uLeUTVgTHFlxspTxh4jjZ21gX7W95JRiUo/WGbtoHSUrkr6Eh3H1hy2CbYjDa
         on3ikAofhQY9dKW/bpeHul4TS1E2nQMwbnl16eWMpoHmNfuCYX1KcoS1GQ/ETIOXzbkM
         AW2kAvU878F1bTo9i5KsnfJU10Ndhy5g6d7Y1t8tQsoZRlfHS+ElWw9++mI+pKpVnnEM
         wvEg==
X-Forwarded-Encrypted: i=1; AL+hErE/ZuvhhV6S7Gr4A3dFk63HLsP2644sX4x4nJrxrT/VdrwPa6g5BOgWjN72yFyE6TwDGqL/zHgtYYjt11nYlw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+V1kEH6fRXJwDkV19J0MNNHd8kCkGTKVr6zTtLZT10xNQRhtB2
	Ldyz+pi9CiP55n+IaRI53TaK6WmsfOFROqLzC0MKHjbJXdop/u0qYssfw+ytIoaRbk2rOtAuBZV
	rqB8WAswaiildjSE+xGlTtk+y8WVkfXiaUq8gib9P7w/jy665RkUvLh0xGkRImc5GEcZYJw==
X-Gm-Gg: AZFdTZdCn6ugI62CuMFfpARLESD3yilhMxj0CMy4YhC9FY5YIonAIv2F5WpA4IykG7C
	X2FG9RwuB49EfBfjUv0YQqv6IM5SLrobqi/ROfwKfWcSpmAYTMn5UiTm3B0v3JjP6qtvq040IGn
	CWoDTQGF4UWehMtU/bQ5t7Y83dUYMJPLNqr1dGioRB+xOXVx6wlnlWOesXbKZT4ltt370Pjqzbm
	Eg4t2p8YTjJ1aHNj5WJmWi6W6oiJe/wA9cfiSFlnjXhbh318opabr3tNJN0ffRXrL07zVQc9OfK
	l27mBCcQmtGuXjVMfPrEXIWEUpFkC7eq9Hh4mfUeNee/WnrezziX5BEmJB+GXd+OcNq/XwV/X9p
	SjWvJFjRtnIEqD+K6dLjTpLspntNHQ1fJcSxZuV8v0IKTzmwZ6EwP/W756B94Wb/5XrEIpYMAwg
	y08NISf0S/QxeqMt7hbkr/6ne0NJXpg1ukyFo57jE=
X-Received: by 2002:a17:903:298c:b0:2ed:42d5:e682 with SMTP id d9443c01a7336-2f03f21d8f7mr20044195ad.41.1795156928495;
        Thu, 19 Nov 2026 22:42:08 -0800 (PST)
X-Received: by 2002:a17:903:298c:b0:2ed:42d5:e682 with SMTP id d9443c01a7336-2f03f21d8f7mr20044055ad.41.1795156927955;
        Thu, 19 Nov 2026 22:42:07 -0800 (PST)
Received: from [10.133.33.8] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a69sm9484255ad.18.2026.11.19.22.42.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 22:42:07 -0800 (PST)
Message-ID: <fd5cf760-b750-4c97-bc32-93bd4451664e@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:42:04 +0800
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
Subject: Re: [PATCH ath-next v3 01/10] wifi: ath10k: fix SDIO aux workqueue
 starvation in recovery detection
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
 <20261112-10k-sdio-crash-v3-1-24f03f300bb2@oss.qualcomm.com>
 <CAFEp6-12bAc5YoP7BaP-GENQsNAifXVxehpdPUu2pi-X8hfC=Q@mail.gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <CAFEp6-12bAc5YoP7BaP-GENQsNAifXVxehpdPUu2pi-X8hfC=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6affebc2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QQEwzqQhIAFD7pLbQSoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAyNiBTYWx0ZWRfX+X4C/Qhbebey
 S8HMLtfBmF67I6ZxQIBfLQEiccx7JW/3izCyAR3dt3tai20PIkItwBImbTTuNnU6k81PoLZ5jKk
 /4IxSzJMxAFUlifscO7858TYXXiy9+Q=
X-Proofpoint-ORIG-GUID: GV8EnnwDea8foon-yB3Ix8d8UZmaxxNr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAyNiBTYWx0ZWRfX5H44JJpsdv8r
 9pDkBcFA33sNWRinZcoUkQV6gJmHWYM5o5/pUQQhp6mm22CDkJaMVQAM8Gu5liDLkY/nQH5GCPU
 lytWPqtqvGycOJUmusYzeu0njzaR0svZBOZeKKQEvk5SmDW4EapUMpyceVF6Q65YFWcCbcNCrzF
 +kFs6UKvmKajHW3l204XQEzGLkPODtLhusIw2/MwgSzo64m8Gglc0zcgPVOQsT59DFm7li4Uoef
 DMGHx8EDBoCKtQLuUlLI/N9iK9M/uXrJsE5CFpZimvE75qtFzmYhpWl8VU9lhD0YauQ9eGLuNGd
 OlbcvQ3qnCB0oFZazz7zhq6d+2lcFq0WOsMs/cMyFrcpJ3YL/qEv1nAp15MeYM0GuKwBS2Hf+ys
 DZHmx4P9bFJJnqcVP+/dfdGG6EjiG2Y+vFJjr0XIoAN/mD+C4HThDewx1QAiIQp26BpWQfOSTgE
 7I1LlbIhoJNuds5Rddg==
X-Proofpoint-GUID: GV8EnnwDea8foon-yB3Ix8d8UZmaxxNr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200026



On 11/13/2026 5:24 PM, Loic Poulain wrote:
> On Thu, Nov 12, 2026 at 12:26 PM Kang Yang<kang.yang@oss.qualcomm.com> wrote:
>> Recovery monitoring runs on workqueue_aux, which is also
>> used by SDIO RX dispatch and WMI SERVICE_READY handling.
>>
>> A single firmware crash may generate multiple recovery
>> triggers. Recovery detection currently handles each one by
>> waiting for recovery completion on workqueue_aux. On SDIO,
>> this blocks the same workqueue needed to deliver recovery
>> traffic, preventing recovery from completing.
>>
>> As a result, otherwise recoverable firmware crashes fail
>> with:
>>    ctl_resp never came in (-110)
>>
>> Treat duplicate triggers as part of the same recovery attempt. Use an
>> atomic compare-and-exchange on pending_recovery so only the first
>> trigger starts restart_work.
>>
>> Convert the recovery monitor to self-rearming delayed work. While
>> recovery remains pending, the monitor periodically checks its state
>> without blocking workqueue_aux. Cancel the monitor when recovery
>> succeeds or the device is stopped.
>>
>> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
>> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>>
>> Fixes: f35a07a4842a ("wifi: ath10k: move recovery check logic into a new work")
>> Signed-off-by: Kang Yang<kang.yang@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath10k/core.c | 71 +++++++++++++++++++---------------
>>   drivers/net/wireless/ath/ath10k/core.h |  2 +-
>>   drivers/net/wireless/ath/ath10k/mac.c  | 13 ++++++-
>>   3 files changed, 53 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
>> index 7c2939cbde5f..82bb0bb72dc7 100644
>> --- a/drivers/net/wireless/ath/ath10k/core.c
>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>> @@ -2493,48 +2493,54 @@ static int ath10k_init_hw_params(struct ath10k *ar)
>>
>>   static void ath10k_core_recovery_check_work(struct work_struct *work)
>>   {
>> -       struct ath10k *ar = container_of(work, struct ath10k, recovery_check_work);
>> -       long time_left;
>> +       struct ath10k *ar = container_of(work, struct ath10k,
>> +                                        recovery_check_work.work);
>> +       int fail_count;
>>
>> -       /* Sometimes the recovery will fail and then the next all recovery fail,
>> -        * so avoid infinite recovery.
>> -        */
>> -       if (atomic_read(&ar->fail_cont_count) >= ATH10K_RECOVERY_MAX_FAIL_COUNT) {
>> -               ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
>> -                          atomic_read(&ar->fail_cont_count));
>> -               ar->state = ATH10K_STATE_WEDGED;
>> +       if (ar->state == ATH10K_STATE_WEDGED)
>>                  return;
>> -       }
>> -
>> -       ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d", ++ar->recovery_count);
>>
>> -       if (atomic_read(&ar->pending_recovery)) {
>> -               /* Sometimes it happened another recovery work before the previous one
>> -                * completed, then the second recovery work will destroy the previous
>> -                * one, thus below is to avoid that.
>> -                */
>> -               time_left = wait_for_completion_timeout(&ar->driver_recovery,
>> -                                                       ATH10K_RECOVERY_TIMEOUT_HZ);
>> -               if (time_left) {
>> -                       ath10k_warn(ar, "previous recovery succeeded, skip this!\n");
>> -                       return;
>> -               }
>> +       /*
>> +        * Pure monitor: only ath10k_core_start_recovery() starts a fresh
>> +        * cycle. Bail if there is nothing in flight.
>> +        */
>> +       if (!atomic_read(&ar->pending_recovery))
>> +               return;
>>
>> -               /* Record the continuous recovery fail count when recovery failed. */
>> -               atomic_inc(&ar->fail_cont_count);
>> +       /* Record the continuous recovery fail count when recovery is late. */
>> +       fail_count = atomic_inc_return(&ar->fail_cont_count);
> I don't understand why we need so much complication and the need to
> count and restart this work again, why not simply scheduling the work
> or a timer at the final expected timeout instead, then if we reach the
> timeout the device is simply marked as wedged.

Yeah, you are right. Early this patch-set will re-queue restart work so 
we have the fail_cont_count. Now only one restart work will be executed 
at one time, so we can delete the fail_cont_count and related code.



> 
> 
>> -               /* Avoid having multiple recoveries at the same time. */
>> +       if (fail_count >= ATH10K_RECOVERY_MAX_FAIL_COUNT) {
>> +               ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
>> +                          fail_count);
>> +               ar->state = ATH10K_STATE_WEDGED;
>>                  return;
>>          }
>>
>> -       atomic_inc(&ar->pending_recovery);
>> -       queue_work(ar->workqueue, &ar->restart_work);
>> +       /* Recovery still in flight; check again later. */
>> +       queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
>> +                          ATH10K_RECOVERY_TIMEOUT_HZ);
>>   }
>>
>>   void ath10k_core_start_recovery(struct ath10k *ar)
>>   {
>> -       /* Use workqueue_aux to avoid blocking recovery tracking */
>> -       queue_work(ar->workqueue_aux, &ar->recovery_check_work);
>> +       if (ar->state == ATH10K_STATE_WEDGED)
>> +               return;
>> +
>> +       /*
>> +        * SDIO raises several triggers within microseconds of one crash;
>> +        * only the first winner starts a fresh cycle. Losers do nothing
>> +        * while the owner runs recovery.
>> +        */
>> +       if (atomic_cmpxchg(&ar->pending_recovery, 0, 1) != 0)
>> +               return;
>> +       ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d",
>> +                  ++ar->recovery_count);
>> +       /* Start a fresh failure budget; the last cycle may not have completed. */
>> +       atomic_set(&ar->fail_cont_count, 0);
>> +       queue_work(ar->workqueue, &ar->restart_work);
>> +       queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
>> +                          ATH10K_RECOVERY_TIMEOUT_HZ);
>>   }
>>   EXPORT_SYMBOL(ath10k_core_start_recovery);
>>
>> @@ -3727,7 +3733,7 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
>>
>>          INIT_WORK(&ar->register_work, ath10k_core_register_work);
>>          INIT_WORK(&ar->restart_work, ath10k_core_restart);
>> -       INIT_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_work);
>> +       INIT_DELAYED_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_work);
>>          INIT_WORK(&ar->set_coverage_class_work,
>>                    ath10k_core_set_coverage_class_work);
>>
>> @@ -3764,6 +3770,9 @@ EXPORT_SYMBOL(ath10k_core_create);
>>
>>   void ath10k_core_destroy(struct ath10k *ar)
>>   {
>> +       cancel_work_sync(&ar->restart_work);
>> +       cancel_delayed_work_sync(&ar->recovery_check_work);
>> +
>>          destroy_workqueue(ar->workqueue);
>>
>>          destroy_workqueue(ar->workqueue_aux);
>> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
>> index dfee432615eb..e8fcbef38ca6 100644
>> --- a/drivers/net/wireless/ath/ath10k/core.h
>> +++ b/drivers/net/wireless/ath/ath10k/core.h
>> @@ -1207,7 +1207,7 @@ struct ath10k {
>>
>>          struct work_struct register_work;
>>          struct work_struct restart_work;
>> -       struct work_struct recovery_check_work;
>> +       struct delayed_work recovery_check_work;
>>          struct work_struct bundle_tx_work;
>>          struct work_struct tx_complete_work;
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
>> index 8e604697d6c2..3c45e5483b60 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -5427,7 +5427,15 @@ static void ath10k_stop(struct ieee80211_hw *hw, bool suspend)
>>          cancel_work_sync(&ar->set_coverage_class_work);
>>          cancel_delayed_work_sync(&ar->scan.timeout);
>>          cancel_work_sync(&ar->restart_work);
>> -       cancel_work_sync(&ar->recovery_check_work);
>> +       cancel_delayed_work_sync(&ar->recovery_check_work);
>> +
>> +       /* ath10k_stop() can race with an in-flight recovery. Clear the
>> +        * recovery state after the works are cancelled so a later
>> +        * ath10k_start() can start a fresh cycle instead of being blocked
>> +        * by a stale pending_recovery that nothing will clear.
>> +        */
>> +       atomic_set(&ar->fail_cont_count, 0);
>> +       atomic_set(&ar->pending_recovery, 0);
>>   }
>>
>>   static int ath10k_config_ps(struct ath10k *ar)
>> @@ -8170,6 +8178,9 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
>>                  ar->state = ATH10K_STATE_ON;
>>                  ieee80211_wake_queues(ar->hw);
>>
>> +               /* Cancel the monitor first so it cannot bump the count after reset. */
>> +               cancel_delayed_work_sync(&ar->recovery_check_work);
>> +
>>                  /* Clear recovery state. */
>>                  complete(&ar->driver_recovery);
>>                  atomic_set(&ar->fail_cont_count, 0);
>>
>> --
>> 2.34.1
>>

