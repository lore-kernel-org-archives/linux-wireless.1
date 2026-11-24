Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485540;
	b=mjk09bi1YgZdlkjqemLOJ1909NSPSU+lwoXk1SPzZb+1jXtUm/iyHkU4smLI0TQjDgNF
	 GTrEuRrsCHqRPTLFYmuwjl96cxBq6jj6EwbjVS44ceaVatvFtirPB7nXZW1AQP4mfvOUr
	 3Zbyk21mz2kD+IAZgeMi53Fo7DLhzxfG9Xc67cxcHfCOX1D3N7Tg1GBpNE9PRX6+sxlj/
	 iivN+9WRzMi42Q/gn5SOA5FOD352yQ3lQpcWWajdVkAzbpEe6krxaf8jRPqnLXKusX0un
	 OplMkYPoZuZHYZoTja8c1eEs6pAsaA9lR3LCXV6fVvwK9+a5FWjW6wEf7RQWBNizHqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485540;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9UvrlVxmAVHO3cEaHfpxSeEvyt+RONCD7RCf3riDDPY=;
	b=K4fiReiZBUV9RkkjjJfXQ4tcT3zDvWASFuFANwNea6vjLBv9HqFdMT1+leuAEXSmWUgr
	 b26SHOKCxcPpmOodQ4b0mF8cTatmXbo/akL/cosg5h7hB45z43W0B/pZ0Gz8/HJaUAAII
	 Ed72Iu7gEtqml7siK4pM37e2AXE4ffpFa4h/pDWK0PfyayGGFCfh+uDczw/58bhSnx8TT
	 G5eiqr0VTD3LdiLho0KeqkpBIF90o+FRvfhXsAZ3MYd0X5AWHi7PdnOOQh/itVdtX0MMl
	 WcaUy0z7cjINY8Dg1TUe2u2vQGQsDe82y6Jfi4G1gLNo/xa95p0mRj/0nc7QpxHYt6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IZoz4xhr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=atqdbSgy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D917606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 01:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D917606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IZoz4xhr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=atqdbSgy
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANMO2MS2663196
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 01:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9UvrlVxmAVHO3cEaHfpxSeEvyt+RONCD7RCf3riDDPY=; b=IZoz4xhr8g1uVQEl
	6TWNmr67vbavrVBS14NiIfS/vAMuiMDji3n0juJQSsRWcSy6XmBF0Vvgh1nQBzWC
	TNxkkDRI9zd6o18r+oGN+lDFe06ln10EOK3IE4YmLCC6ja2sVdY+ETEd3aRvPwFj
	SmSMW059QC9XDIut8Wia334kKxLFPqHf7uPmvgW2VTOL0k9UmnKEc5dp8zmJRJiM
	aQvkrE9ViNUYOF/pbafcENuKueGiycJnQphKUqaVrlS0LswQj2xhbCSmFEFdF4oX
	OeaZ1ubXtHpXr801rcgVfCbYifZoQjit+6ZxvFwz15Mekff+RYr2Gzwbf5/qTHgW
	/fAwEw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f0k8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 01:58:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f05c68629cso23665605ad.1
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 17:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795485538; x=1796090338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9UvrlVxmAVHO3cEaHfpxSeEvyt+RONCD7RCf3riDDPY=;
        b=atqdbSgy0h3diuJ9eVdXF6skaVxRMMjdIdndubRPwQph4SL73u3MQqLFSv5fFcWr5m
         kOpAjwWNXiT3dvpAS8XPX7Kb2KNdpWqQTtUHGLPLyyoU20FmcUkH/q7R4CESZr0LmAYp
         bLE7rQXsOKCuN1wjcCZUcfuk2VIqzhyJQy8l08BCsm5dGHN9tPcDi2ySNcu0q5MYaSwQ
         ARIeAYxoxxGSgGRUvrXS6A0hyPNLHjIagCDLCbaTkUGn+oaQmsyz+kUn2fHQLsU0/sOU
         x6GubVHwSmM0BiaCadK+6B2M3o/dqVg4PE+KHrrVjaXm8QtPMZaOeP0oPNbuRUEi4pmm
         GfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485538; x=1796090338;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9UvrlVxmAVHO3cEaHfpxSeEvyt+RONCD7RCf3riDDPY=;
        b=HT94JFzXwmrrmsKw9F77XU6SXNTMcyoLSCCht90sRsGVmFxt+mXr+xJA1w/4J2Wgk8
         1l3/jgPJoi/TfMwMplTtrpDUgbaGy8QJp1X6ylWO9ue+ju8CNrKMIfOe0uvUFUSODaRq
         T1sNB2yY4E25wE+CxG8pPPcR5m5MkTkleArssMXhoDwpvvKZqR9vdVtghFPjuIjZKFSa
         Dn5q5VJlx0z8+3Bzn43KP89F4rU9+ApQ7s+wmzCSaB7kOo42s9cvrHG1JGQ3dck5KdON
         goqJc1RJCmeltyXc5Tz1Oj0rLZMsfRweyZqu3Bcy0Bx6d+flSwW3DaRgZtpgCUV36dXR
         zKkg==
X-Forwarded-Encrypted: i=1; AL+hErHoxteW+3n6Zjz3+51Sw4t4LAGE6MQ3VsmKR0DnxROAcdSVscS1UITl65EVP3zSKE6SEw8w5CNEJQJn11my8g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8p40RmJ+FlYVtRv9SnIK0gGXHoma43qPXsX3AFuXmwR1cNRCkW
	EOFoU2JS4YHC+UjjmI7V8Dp+ecEpwR4k6zHalPNSlkt9F+JltONmYHmn03x+j4s/JXnlh2ovkXB
	uaDgda7SbaXhIjikd8pxczbv0BYBKxryKuXYZKXxFpp/xuF+qOrerP6JVev/z6BIRE/8NDg==
X-Gm-Gg: AZFdTZemX3SItBZR0ZRMEdHoij3QlN41WiHFpszNrsGjBIcD/e1QyOE6Ahg+Q3NlkRM
	KPPxFun0ZduTlBxWwZIZGnay/4nFqEr/AIzVx+oyQN6XpeRIJW0xxWfEy3yL9C9U1VHZbZ6j6k0
	0vuctCghJ+xONq0EI89EE5DJv/OM1Pweg2aB0ssIUusBvr2BkyzolgFfzmfOp0XILm4ZXjL7vVw
	f1Gav03s9iWeVhc+vHeJUurXc2xebDhUKBmH0tWbWSZ4ChBVXQ2p0/r0KiFWYUD/Jma/qFBs+t6
	4Gti1yFhV+MeXo2vRx6oaylxCkSGHJfZnMbbGH86Pu1Un8mbCs0dEZ0c8ilkm1UZ3VmcO6FiLu8
	64WjPk/+pch67zw+0wde41h038rvwidi9V0U6b2L+DOyUtul+Dvak/0Dmf2b0P6Nvm3FA+D6/X3
	4CVOKg
X-Received: by 2002:a17:903:2f90:b0:2ef:e0f6:b8f2 with SMTP id d9443c01a7336-2f03f1dc68emr144210905ad.51.1795485537903;
        Mon, 23 Nov 2026 17:58:57 -0800 (PST)
X-Received: by 2002:a17:903:2f90:b0:2ef:e0f6:b8f2 with SMTP id d9443c01a7336-2f03f1dc68emr144210715ad.51.1795485537392;
        Mon, 23 Nov 2026 17:58:57 -0800 (PST)
Received: from [10.239.104.253] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1aa3sm60668045ad.21.2026.11.23.17.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 17:58:57 -0800 (PST)
Message-ID: <1ec4b727-a376-42e3-99bf-b5a4d1eb4959@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 09:58:53 +0800
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
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAwNyBTYWx0ZWRfX0pumxP2SKImA
 CnzibY4UlBsNCrlPMgoJnf/BhGT0OnSipf7Li3ls4lvD95koex3VysRWOyEcqt6tcGm5LfzA8Sw
 fOXqh0Fh9xBn5NDp2Kqqt4orQnCoBVU=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b04ef62 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2w8UifUEfps8qvg4efUA:9 a=EUlzmMyR4JpyyxVz:21
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Ujr1hU6x9u7VWdl0sddzWMwauMsg-KLA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAwNyBTYWx0ZWRfX8aPVG6+JJOyH
 LJ0rg4MDOxgEoQl5701Gpl8cU93jMHmVzO1JRTem32bi5n00CDBGIDzQKxGmWMEvZ2f9MXZokwi
 srUmCUZfoKokStzV9C+7aUWpV4bhhQAdk9riYuIjMrN3XBJJqBbQiWel6u7jzZSIcIhuMu99cJw
 x7opl2jnnVXF3ZhKQ3aCvyXt7Dr2VCCrZa/FJvqU8CTouuC0tdTAHUR01GeuL57jqAjgzknvK5c
 xbDjkoSsg+lNuh6d1oUYS+SLNE7DsfNN2eIR0RDIL45mJ2I2/o+g4+CS8svuhrQS871Anl2pkZU
 XtJcR9a9e0X3bZfnYKkPoo6JnmXQYVtKtNc1Xg77dzOYK3iNNNbUFIJTP77JQx6G34u5j3Ez4go
 8k2sVhG/iqJzNeVuhiqBi3vvbWLA8FBnnWuy/WSu6nTcYyBkXYNCYkoTfky6cobe/SYLU4NmtgI
 OWDIr0SGIt6hrgyWnuw==
X-Proofpoint-ORIG-GUID: Ujr1hU6x9u7VWdl0sddzWMwauMsg-KLA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240007



On 11/18/2026 10:55 AM, Miaoqing Pan wrote:
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

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

