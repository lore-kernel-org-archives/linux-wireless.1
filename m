Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220181;
	b=UVIfOoUJOcIZvNBWT4O01Y7249mi2R33NPhXrj9k/nvn6+i3K4aeI7/hMOxWCVrpe02e
	 UJKgsEQw2Zp+atVe7UBqq5a0XYDmbkTS6iqWzseVtmOAzTPe5/UxMvf2MWn7FFtFuxcbl
	 alxOzi7DYCTBw7d+m4Zj0LwNJksqpSATWRHs9Y+9domAodJTtuROyuDljSiac/kkBB28o
	 KOyBSSb/HGbT81NMsowUHIv8wPrP70AmovUbcAT5xP381qKLFeNGp7mbN01vvEXeX1muj
	 g8XCCXkB1JQp61FGaHCHXcImspUu73rWtFhM8337VxKL6btgNBdOa5MFEcfZVWMeQMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220181;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RuWSO5lF81+wvYpAYjE1usBrB0yozSwPs1b5w+/cvek=;
	b=IxVSUtGXXH5bCflWh69DwYXOjZoMJ2ItKxnbanYGddMiTj4ZKdFP5MWN1ooZ5Z/tGHrz
	 UnJrG2QQWnJSseLpwJhaFuMedIp2WAAQhy7nmHEoychma0DWvTtQb/snf1hMTOcOSP6me
	 QIXWoc5JLZHcREjLnu6MwoNSI3zcGurrDOJoFdM7/z3D6FJJAZdf1JLnOjc/HacHNiHRG
	 USImyvLc+YU8LHpiqblMqMGfM+mU9r4ej0n1WXO5AxOgo5S1+p5eHt3OOtnak7rbPWy2s
	 cfHoPFY023UVLGO01WdopYIuyk2XvwwOOxjgBbDvT2WN8llpjV+7Y3GZdJoOlwkUd9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Edc0PtUk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QwO+7QH5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDC7606A6A7
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 00:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EDC7606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Edc0PtUk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QwO+7QH5
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AL0AvBK3274361
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 00:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RuWSO5lF81+wvYpAYjE1usBrB0yozSwPs1b5w+/cvek=; b=Edc0PtUkP9FWaIhe
	lmdyvkougjdN+MSXtPR0+1xryNxiwSrs2TbxSvthgsG5SwZ8lEk0PHo0V52O63JU
	UknBG8+vXBi1B7Awd4JWI0XDTsvU7HHM4Qlz9E/In0ypMqmgrMhP6J+Bp9XC90Do
	Ua3YXOW83YmES7jef7dI4Prg1jp5C/IbX/DzS/9gxVS/JvVZ0n/x0a72eJ98404a
	wv9+KOoRi6UoK95WXYQh7QyK4f+ljHQDNPWf9TEBEw3bSYb2SckRy26xMQr9nazE
	Xcb+H6hqM2wjE9SbOAfFt0CVTf+8rwyRR0sUoF7puJUGJLqXAZpD5msg8aUZ06LI
	+2DemQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2y2988yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 00:16:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38131260a5dso3763193eec.0
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 16:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795220172; x=1795824972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RuWSO5lF81+wvYpAYjE1usBrB0yozSwPs1b5w+/cvek=;
        b=QwO+7QH5JU8mcbBb4FX5REZ9kS5x3VFPvjDtyVRMtQv1d/9Jt4HX+8khMTQva7kH4m
         IA/EMrzCD9q1dIGnswSV4K98oU6e1wEZkfCvPPM8H6+d0C/qxu2fVXNbSKzJFlilrwKr
         jYH+y8bgUDI/bGjad8D0EWjplyKvRRDg+EQWY1mbosveLKxd2BL0OtaGtIMBo5jyBrpZ
         aZlzJS4hE37jFVktHn6mYQq3yjTOXxt7hoQMC80arIaLOgHWKS4gi0b7FKBD0WR+C3Mm
         SP0wY8dkiyqw4BYJ2N6P78CE7v6v/0AvH+byKyR4j855V9Oo/VePMA8aHhffPSsnU9h1
         tJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220172; x=1795824972;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RuWSO5lF81+wvYpAYjE1usBrB0yozSwPs1b5w+/cvek=;
        b=0FkxEkLFXaYtaS3+KpajXnR1va26MInRBznk0udwoV1ndd6iqWKohrRL/Vmr8FOA4U
         6FKUIHNpNXlARNdeiD9tejMtY+i0jS+LCyDPlvSM9M7OZPYUQ9yPCUeWsO4dcvMP1Lq7
         WQEZh33UwkrkHA0l2hvvnYzjoBE50vCmkOH60BYEL28hNZbvmP4veR8bdBgNwuQPeacD
         hf8aekoQkYwgs7xEpRkCFgRf/CUmkw9IsQVhYCTSbnlxGAaIpex+9o6MyhtKEmAOebd0
         A9t4vdyRIBjItOpDOpBSJuNKBLLUUSQUZ37HgJhQuyONyJvGw5Hje2LhsjEDb4HZ95rC
         iHow==
X-Forwarded-Encrypted: i=1; AL+hErEaK7OK8mlG6ZikKZ0sdpUP9LZwmC1xnMR48Ryq2vbDbyE8LPAxspm91JqzVg6HhN8CD+NVHhCVB67/hEPTUQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+A6KTa/Wp70JZVey/vpbBUxrTHYJAR3zSUHYmy1vbE6hcW18X7
	tWGmObPPfQxZqI86CtFDqVYTG0UIsC6PnxKS1O6Tu7Hf65yFZRLhQkjeSA6vbwS9MsEKzfyC0VU
	UkRfOqczzermfc4y/s93aYUV5jVQBD/V7Bp4cpUmhK7POkvW9cEDfMyg6IHgCV/jQ9i+VHg==
X-Gm-Gg: AZFdTZcRihamucWdG9QfBbdswGijR9mcBQ2Mb78uk/TFuK7Z1rtmhXYXeQyZ6T0ol2t
	bUGGPlhj0kM9+9Ia5HbxiSFBA1QUTZ7d0QZtVhrZErIXFms3YaLDKsbJIrpy4UkOI2YsnwWdZ4e
	duCvc75XhPNnoIxVa3zdCpAtOAZB91M3pyhV09cr7KWzssBrXqf0CFf84uU8wlsF5fxw4O6QC9K
	rzckD2DnDNatoMfBnJTxl2OYf8xe6C+4Mr/Svlyic3Uhh6cs7Ua0jlRRfBIN+v96hSVmmjedNAV
	duV1qqF+6CThEfJtiIX4SDpJ/R+uiB0IdtDcL9WRTDUtQ9mABX8kXKvwPml/9WZOeoUW03botg2
	XZsGQYcunKO9m9uTIvK500gAFizMyx2ZFXVkxUmA+/sUCqfFaLETXgJUvkRAT0XqRIazxd4BOGw
	Sz4Edoc6ZohUS+n7Hrssxm0SRil1UV
X-Received: by 2002:a05:7301:9a82:b0:369:4c3f:8a5 with SMTP id 5a478bee46e88-3856ef45385mr4873238eec.14.1795220171897;
        Fri, 20 Nov 2026 16:16:11 -0800 (PST)
X-Received: by 2002:a05:7301:9a82:b0:369:4c3f:8a5 with SMTP id 5a478bee46e88-3856ef45385mr4873184eec.14.1795220170973;
        Fri, 20 Nov 2026 16:16:10 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm10282028eec.8.2026.11.20.16.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 16:16:10 -0800 (PST)
Message-ID: <43452750-2fff-46f7-bc61-2f5547602c85@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:16:09 -0800
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
Subject: Re: [PATCH ath-next 0/7] wifi: ath12k: fix MLO active-links handling
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDAwMCBTYWx0ZWRfX630pgPqG55js
 QYGr8ByA2DRXHtFZqYFxuxsAQk9grmG4go7e3tmxLRouJP8RHvBJTtq7MZYVAlieq2EVwQdXzXm
 1nAlY1vg+r3yWIxTFTTjBibRuam+4KA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDAwMCBTYWx0ZWRfX6Idt0YwxUFnj
 AmxbqNYJhMPVRW6Ln4XMzLK6u8p3+9Xc12BNKgG88kIvZhVwwv22686E4iPXu9er6SozjRJRr0e
 8TDYG1bHuxUnKbBf5GjndsIVbqWAtV2qcOc0JAIjTFt81rd2Z7UlnCKYtfNRjd7cHts548Ik4BY
 Vl3a4pXGoGs1ZVDkoMM9ghShpmgwtK0Xok8DRY/x5+XKvbidFgWGHvqhI7PQQmPBijPhd+hb4yG
 heyj1CSn7lk7E9cKInzjF/xX8BiIgqaJ3JC2g8rVS4lIA7Hw4/IY56VclhGQJqKTSn0mTeIhDH+
 yImqYiTxPwVvL0YNXOwhxkjFE8wNAtcpxW4kkOFotUTuxQKIvUI5B4K4EvaOBL7qjZYR4qvcTay
 CZg65qlvNaG8qCYoVGAhSspn7AD1YwJrtA4hXjRvj83aGp/dfXw02SWABjK7Mzi2ho2eeMSdrWw
 0OdXvVplXGC8HUebeXA==
X-Proofpoint-GUID: -y4xCJAvqst219JLhyWHeBd2yV0gA7Ob
X-Proofpoint-ORIG-GUID: -y4xCJAvqst219JLhyWHeBd2yV0gA7Ob
X-Authority-Analysis: v=2.4 cv=Z/J5j3RA c=1 sm=1 tr=0 ts=6b00e2cd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=4HNrfPhIyE3k3xtOv_UA:9 a=EUlzmMyR4JpyyxVz:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210000

On 11/17/2026 6:55 PM, Miaoqing Pan wrote:
> mac80211 calls drv_change_vif_links() and drv_change_sta_links() for
> both valid-links and active-links changes. ath12k does not distinguish
> between the two, causing WARN_ON/incorrect teardown in change_vif_links(),
> inconsistent vdev state in the chanctx callbacks, and silent
> firmware miss in change_sta_links().
> 
> This series derives link object lifetime from vif->valid_links and
> sta->valid_links, which mac80211 updates before calling the driver,
> instead of from the active-links sets. A STA link vdev keeps running when
> its link is deactivated. The active/inactive link state is programmed to
> firmware with WMI_MLO_LINK_SET_ACTIVE_CMDID, sent to each device that
> holds vdevs of the STA, and only when it differs from the state last
> programmed.
> 
> Patch 1 adds WMI infrastructure: the response event struct,
> WMI_TAG_MLO_LINK_SET_ACTIVE_RESP_EVENT tag, and the event handler
> registered in ath12k_wmi_op_rx(). The handler only parses and logs
> the event at this point; delivery to the waiter is wired up in patch 7.
> 
> Patch 2 sets CTRL_F_OVERWRITE_FORCE_ACTIVE_BITMAP and
> CTRL_F_OVERWRITE_FORCE_INACTIVE_BITMAP for FORCE_ACTIVE_INACTIVE, so that
> firmware replaces the force bitmaps instead of accumulating them. It also
> copies the AP MLD address into the command, and fixes the
> CRTL_F_DYNC_FORCE_LINK_NUM typo.
> 
> Patch 3 fixes ath12k_mac_op_change_vif_links() so that link vif lifetime
> follows vif->valid_links. A link that is only deactivated keeps its link
> vif, and a disconnect (valid_links == 0) removes all remaining link vifs.
> 
> Patch 4 makes ath12k_mac_get_vif_up() skip links without a channel
> context. A deactivated link keeps its vdev up in firmware but has
> released its channel context, so it must not be used to derive the
> target pdev. The WARN_ON() in ath12k_mac_get_target_pdev_id_from_vif()
> is kept.
> 
> Patch 5 stops clearing is_started for a STA vdev in
> unassign_vif_chanctx(). The vdev is not stopped there, so the flag now
> keeps matching the firmware state. assign_vif_chanctx() then compares the
> new channel with started_chandef: if it is unchanged nothing is done.
> Otherwise the vdev is restarted on the new channel, or stopped and started
> if it is not up. Station removal clears is_started once the STA vdev has
> been stopped, so that a reconnect on targets with vdev_start_delay starts
> the vdev again.
> 
> Patch 6 fixes the bounds checks in ath12k_mac_mlo_sta_set_link_active().
> The vdev_bitmap and inactive_vdev_bitmap arrays are sized by
> WMI_MLO_VDEV_BITMAP_SZ, but the checks compared against
> WMI_MLO_LINK_NUM_SZ. Both are 2 today, so there is no functional change.
> The checks now use the constant of the array they guard.
> 
> Patch 7 makes ath12k_mac_op_change_sta_links() create link STAs for
> sta->valid_links that are not yet in links_map. Link STA removal is
> still left to STA removal, as firmware does not support it. Once the STA
> is authorized, a link holding a channel context is active, and a link
> with a link STA and link vif but no channel context is inactive. The
> result is compared with ahvif->fw_active_links and
> ahvif->fw_inactive_links, and WMI_MLO_LINK_SET_ACTIVE_CMDID is sent only
> when it differs. It is sent to each device that holds vdevs of the STA,
> with that device's links, and the driver waits for each device's
> response, except in the INACTIVE_LINK_NUM case, which is sent without
> waiting. If a device holds some of the STA's links but none of them is
> active, the update fails with -EOPNOTSUPP. If the device crashes while a request is pending,
> ath12k_core_pre_reconfigure_recovery() releases the waiter before it
> takes the wiphy lock.
> 
> Patch 7 depends on patches 1, 2, 3 and 5: it needs the response event
> from patch 1, the ap_mld_addr argument from patch 2, link vifs that
> survive deactivation from patch 3, and a STA link vdev that stays
> started across deactivation from patch 5. Patches 1-6 each apply to the
> base on their own, and the whole series applies in order.
> 
> 
> Miaoqing Pan (7):
>   wifi: ath12k: add WMI response handling for MLO link set active
>     command
>   wifi: ath12k: send overwrite flags and AP MLD addr in MLO link set
>     active
>   wifi: ath12k: fix ath12k_mac_op_change_vif_links() for active-link
>     updates
>   wifi: ath12k: skip links without channel context in
>     ath12k_mac_get_vif_up()
>   wifi: ath12k: restart STA link vdev on chanctx assign if channel
>     changed
>   wifi: ath12k: use WMI_MLO_VDEV_BITMAP_SZ for vdev bitmap bounds check
>   wifi: ath12k: handle MLO active link updates
> 
>  drivers/net/wireless/ath/ath12k/core.c |  15 ++
>  drivers/net/wireless/ath/ath12k/core.h |  25 ++
>  drivers/net/wireless/ath/ath12k/mac.c  | 335 ++++++++++++++++++++++---
>  drivers/net/wireless/ath/ath12k/wmi.c  |  54 +++-
>  drivers/net/wireless/ath/ath12k/wmi.h  |  11 +-
>  5 files changed, 405 insertions(+), 35 deletions(-)
> 
> 
> base-commit: 4016f6c3149e7e3faccc1654db6a3030c069383a

My review agent notes there is a pre-existing issue that isn't addressed by
this series.

The review:
"file": "drivers/net/wireless/ath/ath12k/mac.c",
"line": 12683,
"summary": "arvif->is_started stays true when vdev_stop succeeds but
vdev_start fails, breaking the firmware/driver state invariant",
"failure_scenario": "In ath12k_mac_op_assign_vif_chanctx(), the !is_up
STA restart path calls vdev_stop (which does NOT clear is_started) then
vdev_start. If vdev_start fails, is_started=true but firmware has the vdev
stopped. started_chandef still holds the old channel (vdev_start_restart only
writes it on success). On the next assign_vif_chanctx for the new channel,
the same-channel check (line 12673) does NOT fire since
started_chandef≠ctx->def; however, calling vdev_stop again on an
already-stopped vdev hits the num_started_vdevs=0 WARN and corrupts the
counter. For the same-channel case a future assign_vif_chanctx would silently
return 0 without restarting, leaving the STA with a dead vdev in firmware
indefinitely."

My refute agent concurs:
is_started can diverge from firmware on a failed vdev restart ·
mac.c:12667-12693

Confirmed the mechanics: ath12k_mac_vdev_stop() (mac.c:1556) does not clear
is_started, and ath12k_mac_vdev_start_restart() only sets
started_chandef/num_started_vdevs on success. So in the new STA restart
branch, if vdev_stop succeeds but vdev_start fails, is_started stays true
while firmware has the vdev stopped — which violates the very invariant this
patch introduces ("driver state matches firmware state"). A later
assign_vif_chanctx for the same (old) channel would then hit the
cfg80211_chandef_identical check and return 0, leaving a dead vdev.

Caveat on severity: this is a firmware-error-only path, and it exactly mirrors
the long-standing switch_vif_chanctx() error handling (mac.c:12007-12019),
which has the same gap and clears nothing on failure. So it's a real but
pre-existing-pattern concern.

I also concur with the recommended action:
 — worth a note to the author (clear is_started on vdev_stop success / after a
failed vdev_start), not a submission blocker.

So resolve with a follow-up patch if necessary once this series lands.

/jeff
