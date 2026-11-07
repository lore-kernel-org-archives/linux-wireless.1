Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794076974;
	b=xpfs7XdeZiQurRIHXzmhmwYU68pQQVFajbGXG5fb9m6926uh9BwaIpPIivXkKwjrbgsr
	 73+N1Ba2q/e3zn96m3juEbnkZEVB/HQuiHTnE8jrCsC606mA3dys5rUbpzMDepr/BGFA5
	 LLIST21IunPonxEPDs7WqWUgd66kP0YExFSQKjFQ9JgER2YTabL1Gt1A48T4QNIdg9gko
	 /UOhiCTkhvV3v/4gwvk4aEiJvovrbKSlABj0BoELLDTklhCR889GhHj0SIVBKRJOnGJJB
	 ZjSzKxYHepznNFGKRfL/yxBpbPEkLK45w73YebYNI5YieeKBUR8TilEC2YrKDcbdIqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794076974;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wUljkWXM5YIr3IHe/ud5vspaOE/fK8urBfswZ8VpV9Q=;
	b=bRjPL3X1I6339N1gqZh3MJ4l+cgVQSnt3Ld5Tc7xSM5Kk0NnnnwOT+N1VrfDXkJLVCJX
	 Ue8gVBMnS3WiGUmi71EIUY/9zu5xZ0ait0WWCMImQti1sztCzYHfctapnoj5xkptLiaPR
	 FqM3sUHrN+s1SkzZgVF8kmWWOfLnukZRIZaJU8XNKZjyEUG2sb39l7ovAXHxmaa9GsLT1
	 GGHYBp5D/tPILx7utZtEByVfJDkMm+kZCkpiTRzU/agQpsnB9WzwqmU0ZL5Wd5ucwPDPn
	 EqQ1Ce7rgAh+B2fiSfRHOvGIAoiD6XBXNVxPhb2POKviPm4Lqe3kmgKi92SdPSwHRDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tpe1w4AO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="I7Mp/KTf";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A03606A326
	for <linux-wireless@vger.kernel.org>; Sat,  7 Nov 2026 18:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50A03606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tpe1w4AO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I7Mp/KTf
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7Ht2TV3386581
	for <linux-wireless@vger.kernel.org>; Sat, 7 Nov 2026 18:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wUljkWXM5YIr3IHe/ud5vspaOE/fK8urBfswZ8VpV9Q=; b=Tpe1w4AOCXSQrylg
	/UdbmHQb/3XF87X2knL/1Un9ukQ6kSfhLPPz3Bhz0crDK0bHJgTnDJPkfy7KIc/y
	YVotijc986zVBDsZ15VpR+adMsogm8od/gxtGB7QwXBWKiAY5ROIYc0UAppesU1Q
	AxYOpOl8gzvY6nYQ6qYdQZkILbaW7j07jBy4+XYNvgoSkAvKGiKlK98+k60epo4N
	UPbAf+uYncz8ghivtbgX3yg/fZpTf2YFrC0Mm3rj1zaAJP5mZlpdgzkK0D5M1O9d
	BgbeVtp9a6zesM6TET1dpCFhnNnGaq/I0MUWO4kJj+1rpLR7qjxQmcudSJGK14jy
	tUFReQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv731e7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Sat, 07 Nov 2026 18:42:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a3451ea93so2593724eec.1
        for <linux-wireless@vger.kernel.org>; Sat, 07 Nov 2026 10:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794076973; x=1794681773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wUljkWXM5YIr3IHe/ud5vspaOE/fK8urBfswZ8VpV9Q=;
        b=I7Mp/KTfXdM74YGvNtZ6b3Xxf1zpI5yBzYBJG9+HiBPMV44KFKnoYAPy6jD3xvP7QB
         uidw3Y9gqCVQ1FH97aBx0Pa+I0USNb25oDLUb7mLGrCPYo23djriD3oz4hEI0ous7XZI
         GxpjKl9pqLvp4O3B9Lot/OGjKeUcFtB/A4eOg7+2nHLelqkw37NPFMpAtOVi19Vu282o
         93CJUL67rn4TZg/Ea5+YV+AJTzoyErqlfSKgJUT2v/4tkQAzhMPo4Dzy5hvtukmuocf0
         cCyLjhQ+Qym6ABBvb+SMAkBW3Qe4gk2Zv2JKIxwMhZbwFkhqqCn2vP9yCiIm3bSTTI7v
         vgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794076973; x=1794681773;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wUljkWXM5YIr3IHe/ud5vspaOE/fK8urBfswZ8VpV9Q=;
        b=TzRbrkZmm5EYcV0jLEWzr/OOEZeLqbW1EWjl2GpOTWnQJFIBICQY57fGGi8Q1ZQCNJ
         1r9v/Qr8pRaRXSqWMWjFezAuQf4nQNS3IFiwjzKeyTxskw80Ux9in8CuEchVFnMLUEN6
         +9vz13DN0oIDYuLX+gCQG108jfrWCqvjKkBSu09ueqrltFQB3/ulMxnR/NDpT+/1uWAn
         V9bXMX//81xb9i2vsO2Rmpy7//AXFbxPqp4Vng2e/PO525QPx4d5G0n+NEga/uANk7os
         Nfpc+HUC9aJw7oEbezsi+WzQdY3TcXOkaNl8JFy2tjuBC5XIESsNgb7xlUa9FtnasFfD
         4WbQ==
X-Gm-Message-State: APuU4Z/artHI/reziEf3GHYdZVWao0tfA+BxzEpqPr1qXQPEUMB0E6qD
	6tSEwqw48Tllui3OUMDanF25NVRpSNOk5fNKTrnnCphvGre2EspjaWJp0yDcoOvjCjXu3WAd9y7
	D9o7Ykeoelghw6HmnDe9X/qrv04EWL4TlND77UB7s76f6BcHN/C+7GzxELyDsq3KtgPGv0g==
X-Gm-Gg: AYBFou17wCd5/N7U9dbyLW+SZHFur7KrnDnzCzdW/9Jwo5+57JjXUsOuw/I/+ikEv7Z
	aX9qSogJBubd8DSwMX5qsxe9mRFlIguEruf8LmLogL+pxXU44WKxa+74rf1v3OVFdeux4/WFzaE
	rH1daHSkBy3EiJeYepe5t0Kk3TrT6iRPbpYDQBT1dTdIcgiKu670GvhrvzzE0t3+rHdnQ37hZrJ
	8pDCnGLJa+KO7y6L9C+6N/iHyzirf0zvtHCom7DcvNCdUYTgX/qrpd2dvy7YtZTWlfw22C2OTqg
	BjFtMqaRNmpvdndXJ4lO8gLvQSKGn3cOCd5K2tiWY03aKHxNB+ovmayi4tXgE2TXc3r/93trXkc
	sKhMvqOKzaYQnEMZjoTYPiyjEOoKom25UDjk/seXOqJCOQyIy9VFDdQP1PjUtvaH6EOtnMdq96P
	q/oman+Q2o6eRy0CXH0y1I+YPcGsc7dw==
X-Received: by 2002:a05:701b:42c7:20b0:185:8c9f:de82 with SMTP id a92af1059eb24-1b25d33da4amr7987505c88.33.1794076972292;
        Sat, 07 Nov 2026 10:42:52 -0800 (PST)
X-Received: by 2002:a05:701b:42c7:20b0:185:8c9f:de82 with SMTP id a92af1059eb24-1b25d33da4amr7987469c88.33.1794076971448;
        Sat, 07 Nov 2026 10:42:51 -0800 (PST)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm230374c88.13.2026.11.07.10.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2026 10:42:50 -0800 (PST)
Message-ID: <e2c96de5-7d70-4534-9f2f-7503d1d3aa50@oss.qualcomm.com>
Date: Sat, 7 Nov 2026 10:42:49 -0800
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
Subject: Re: [PATCH ath-next] wifi: ath12k: accept num_users equal to
 HTT_PPDU_STATS_MAX_USERS
To: Goran Sustek <gsustek@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <20261101203718.60679-1-gsustek@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261101203718.60679-1-gsustek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDA3NCBTYWx0ZWRfX7h2VRNeau4yn
 JK2+OrXmH9JJyZJajFYp2bJiG4hRR9ujiAkjN5o6rbbGOZg84YVcligHDBGiJewhuIKr8KpIbx4
 yXG+Mxr2YF2Sil0W237PclEmt8nnU50VZGGEBmM+pRh16glLT8TKf+iRipKfAzxmAE3V0DQ6CtO
 /fSY73sQUsTR7YGpqboFGtYS8iQFaqxiwJmwGlQYfTQpyaPeWhjbMEOOuJQ/clXouAs4/3tRfia
 s0GSuTSH86r0NVpFQ0uV/VilS0js+Z4yDkv/BC0B9IkIW3LsBqTU1ESOY2gr4nU3j3TtjfRl40q
 s0LB2TMiqQHGzCTzs5DQf62fZZLXpO7uwsRtk4wGgD1GG2m2KsOgEWAMnldti4x/OVXubc0Sr19
 3IH8SMs61MusSjkAtsE59KMqcRWtzy7qyalYIvfpgcmNdK+m5x4hLY/L1Enj4VdsGaUBA7TpvIK
 +OH1CNgVeSLH3Q/n1pA==
X-Proofpoint-ORIG-GUID: 4P_4MMNRrZPzd0qwx-D9zKBIAymZVH2D
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6aef712d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=rp710-oh4uw8x6QSWtcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDA3NCBTYWx0ZWRfX9EYFBgjTappa
 rtdeiA4J4LNDK2z9UCU3YAaQ+HlJmhTwZ+N2kWpRCmFq9TRph8norVGs7F+nI1n7Zy+49ZCWdX9
 214smPjQVAup1rLavFqvj6lhGk7DPV0=
X-Proofpoint-GUID: 4P_4MMNRrZPzd0qwx-D9zKBIAymZVH2D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070074

On 11/1/2026 12:37 PM, Goran Sustek wrote:
> ath12k_htt_pull_ppdu_stats() rejects a PPDU stats message when the
> common TLV reports num_users >= HTT_PPDU_STATS_MAX_USERS. The check
> guards a loop that iterates i < num_users over user_stats[], which has
> HTT_PPDU_STATS_MAX_USERS entries, so num_users equal to
> HTT_PPDU_STATS_MAX_USERS stays in bounds. Commit 1bc44a505a22 ("wifi:
> ath12k: fix possible out-of-bound read in ath12k_htt_pull_ppdu_stats()")
> rejects that value, which is off by one.
> 
> QCN9274 firmware WLAN.WBE.1.6-01243 sends num_users 8 in messages that
> otherwise parse cleanly. One AP logged the resulting warning 468 times
> between 2026-08-17 and 2026-11-01, always with the value 8, and never
> logged "Failed to parse tlv":
> 
>   HTT PPDU STATS event has unexpected num_users 8, should be smaller than 8
> 
> Accept num_users == HTT_PPDU_STATS_MAX_USERS.
> 
> Rejecting a message has no functional effect: the PPDU entry stays on
> the list, its per-user statistics are applied when it is evicted, and
> the only caller ignores the return value. A larger value is therefore
> not worth a warning either, so report it at debug level, as done in
> "wifi: ath12k: downgrade log level for CE buffer enqueue failure".
> 
> Fixes: 1bc44a505a22 ("wifi: ath12k: fix possible out-of-bound read in ath12k_htt_pull_ppdu_stats()")
> Signed-off-by: Goran Sustek <gsustek@gmail.com>
> ---
> Notes for reviewers:
> 
> The check guards two loops that can never run. Both are gated on
> ppdu_info->tlv_bitmap, frame_type, delay_ba and bar_num_users, and the
> first also on the per-user delay_ba; none of these is written anywhere
> in ath12k, not since the initial driver (2022). The parser that would
> fill them (per-user common TLV, MU-BAR user count) was never ported, so
> ath12k_copy_to_delay_stats(), ath12k_copy_to_bar() and the peer's
> ppdu_stats_delayba/delayba_flag are unreachable as well.
> 
> If you prefer, I have a patch ready that removes the loops, the helpers,
> the fields and this check instead (about 90 lines, no functional
> change). Keeping them only makes sense if delayed block ack accounting
> is going to be implemented. In that case the BAR restore loop also
> needs a bound (it iterates bar_num_users over user_stats[] unchecked),
> and note that the per-user slot finder only uses
> HTT_PPDU_STATS_MAX_USERS - 1 slots.
> 
> Compile tested only (W=1).
> 
>  drivers/net/wireless/ath/ath12k/dp_htt.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_htt.c b/drivers/net/wireless/ath/ath12k/dp_htt.c
> index 72069640bd38..9a409dd44d98 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_htt.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_htt.c
> @@ -487,12 +487,12 @@ static int ath12k_htt_pull_ppdu_stats(struct ath12k_base *ab,
>  		goto exit;
>  	}
>  
> -	if (ppdu_info->ppdu_stats.common.num_users >= HTT_PPDU_STATS_MAX_USERS) {
> +	if (ppdu_info->ppdu_stats.common.num_users > HTT_PPDU_STATS_MAX_USERS) {
>  		spin_unlock_bh(&dp_pdev->ppdu_list_lock);
> -		ath12k_warn(ab,
> -			    "HTT PPDU STATS event has unexpected num_users %u, should be smaller than %u\n",
> -			    ppdu_info->ppdu_stats.common.num_users,
> -			    HTT_PPDU_STATS_MAX_USERS);
> +		ath12k_dbg(ab, ATH12K_DBG_DP_HTT,
> +			   "HTT PPDU STATS event has unexpected num_users %u, should not exceed %u\n",
> +			   ppdu_info->ppdu_stats.common.num_users,
> +			   HTT_PPDU_STATS_MAX_USERS);

please don't change the warning. this is flagging a discrepancy between the
driver and the firmware and should be reported if it occurs in the future
(i.e. if a future firmware supports more users but the driver isn't updated)

>  		ret = -EINVAL;
>  		goto exit;
>  	}
> 
> base-commit: a3ddbb45768717b5c9f923489387cf55c838d1ad

My review agent says there is lot of associated code that is also treating
HTT_PPDU_STATS_MAX_USERS inconsistently. Much of this is directly inherited
from ath11k. I'm posting these finding here so that the developers can further
evaluate what approach to take with this patch.

BCC: Qualcomm's ath12k internal review list

/jeff


❯ can you provide a list of references to the patched version of the ath12k
  code where num_users == 8 isn't properly handled?

Here's the corrected and complete list, now reflecting that the firmware
genuinely sends 8 users and the 8th is silently discarded. All sites are in
drivers/net/wireless/ath/ath12k/dp_htt.c unless noted.

1. The 8th user is silently dropped during parse (root cause)

- dp_htt.c:49 — ath12k_get_ppdu_user_index(), loop i <
HTT_PPDU_STATS_MAX_USERS - 1 (0..6). Can only allocate slots 0..6, so the 8th
user never gets a slot and the function returns -EINVAL for it.
- dp_htt.c:95-96, :115-116, :135-137 — the three parse cases (USR_RATE,
USR_COMPLTN_COMMON, USR_COMPLTN_ACK_BA_STATUS): cur_user =
ath12k_get_ppdu_user_index(...); if (cur_user < 0) return -EINVAL;. For the
8th user this returns -EINVAL, so its rate / completion / ack-BA TLVs are not
stored.
- dp_htt.c:176-178 — ath12k_dp_htt_tlv_iter(): if (ret == -ENOMEM) return ret;
— only -ENOMEM aborts. The -EINVAL from the 8th user is swallowed, the
iterator continues and returns 0 (:183). This is why the drop is silent and
:486 ("Failed to parse tlv") never fires — reconciling the commit's field
evidence with 8 real users.

2. The 8th user's stats are never reported (consumer side)

- dp_htt.c:365 — ath12k_htt_update_ppdu_stats(), loop user <
HTT_PPDU_STATS_MAX_USERS - 1 (0..6). At eviction this pushes per-peer TX stats
for users 0..6 only; index 7 is never consumed (:195 indexes user_stats[user]
with that capped counter). Even if slot 7 were populated, its stats would not
be reported.

3. Loops whose ceiling the patch widened past what sections 1–2 can fill

- dp_htt.c:504-512 — delay-BA backup loop, for (i = 0; i < common.num_users;
i++). The patch (:490) now lets num_users == 8 through, so i == 7 reads
user_stats[7] (:505 peer_id, :510 usr_stats) — a slot section 1 guarantees is
empty. In-bounds and benign today (write at :512 gated by usr_stats->delay_ba
at :511, which is 0 for the empty slot), but it's the concrete ceiling
mismatch: num_users admits 8 while the allocator fills only 7.
- dp_htt.c:519-527 — BAR restore loop, for (i = 0; i < bar_num_users; i++),
reading user_stats[7] at :520/:525. Driven by the separate bar_num_users
counter (dp_htt.h:1296), never bounded by the :490 guard before or after the
patch — same empty-slot-7 exposure, pre-existing and independent of this
change.

4. The patched guard itself

- dp_htt.c:490 — if (ppdu_info->ppdu_stats.common.num_users >
HTT_PPDU_STATS_MAX_USERS). Correctly stops rejecting num_users == 8, but it's
a necessary-not-sufficient part of "handling 8 users": without the - 1
removals in sections 1–2, accepting the message just means the 8th user is
discarded a bit later and more quietly instead of the whole message being
dropped.

Supporting declarations

- dp_htt.h:1282 — #define HTT_PPDU_STATS_MAX_USERS 8
- dp_htt.h:1287 — struct htt_ppdu_user_stats
user_stats[HTT_PPDU_STATS_MAX_USERS]; (slots 0..7)
- dp_htt.h:1115 — u8 num_users;
- dp_htt.h:1296 — u32 bar_num_users;

Excluded after checking (not this path)

- dp_mon.c:905-909, :1049-1053 — ppdu_info->num_users bounded by
HAL_MAX_UL_MU_USERS, separate monitor-mode struct.
- dp.c:355-417 — TCL bank-profile num_users, unrelated.
- debugfs_htt_stats.c:2166 / .h:1216 — a separate __le32 num_users display
field.

Bottom line: to actually store and report the 8th user, the minimal change is
removing - 1 at :49 and :365 (both in-bounds against the 8-slot array), on top
of the existing :490 relaxation. Sections 1–2 are the real gap; section 3 is
the cosmetic ceiling mismatch that disappears once slot 7 is legitimately
populated.

