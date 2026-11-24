Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795500124;
	b=rGihqNsp+kZEOVUTNRcz6e2zLBjrvON2E5fXmentownsjFWuSAgl3vv+Qo4EufjunuhA
	 3BZjXN43e1GWKsKs2XHUB0oJTpsD8QRVqE9Um1fr23/Dlzl0PcigBII/CEaCbma6gisBq
	 d6xL0wRuPrGcyC3sr6Y+2fnevgVJyWnTzfrxMo+f+DmlCar6ZZgEAephE2oYwdBinrnzc
	 jWEZJa9tkcLyjpLKrIOVHceiDLPezzgEnvnbl0b65EcG8JgHwpq2iUfmH4bY/CiaHhQd6
	 kA2JUfXlSPv11bGJ2KBh7YIgfs7F8vvqzpfigdG6F+42qnLc/hAOhOu5hCPVVMJSFpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795500124;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SsfcmeOTukl7/t7yQZVfnisPQQJg5RQQ9zI61Zt5Jo4=;
	b=yhEb2dqq/jMf2tgxUbSZVLcMqPwKEcGIXRxBbHGUvy41V5CpVCHj6jjbOcVOUZga31ep
	 L9a2tZDnyRLauMzkUsHVlQwB1399TwE4FWGL6hfQseGqGB0IvnN6mPIan4ay+pCQjQUGH
	 XNAXMwDYqEkhfDTIhS/+tmg7+zgtW6Kffb6rnGfbE0v18LeaXLEkuqWz6eIiMwvwq7Sev
	 ngbIt+syeBLTFzke4fs67j7PasNKxMV35dlAmf/lcaHEKRPPk5rLNmP29ii8E3oCHokhL
	 ayOUXWBDct06aRAJn2LK8OG/RRDTDXNjG/T1zKWng7/K7/mRLvq3M9I0UQRvzb8WEQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XD88skF6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ov3xgkfC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D771606A322
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 06:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D771606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XD88skF6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ov3xgkfC
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2ldfg1598158
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 06:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SsfcmeOTukl7/t7yQZVfnisPQQJg5RQQ9zI61Zt5Jo4=; b=XD88skF6O75xVU8I
	2WCcnpq4vSCQrWPfnb1NfTs1ovWgRKA8wQD3dXWBgBsMt1AQaFonaoaQDcBuO+IY
	ZmqopUsPyemEZWk5WH1QUxv+ohHyiupwsIxucUVjQv2SU9glld61pGiVYCqzUc5v
	TL1QXouq4oDYtZ0e2jd+PEQPZhnzamL1m5N5mSepHAXzoq6GjXRP16PsjQVFuVPb
	osNzGW1BXMi0bLgKC4td301mflTclbr3CbQarWcAwrbwafZqe0H1nD2J61X+d3mM
	r/wJbXz3wSO9HuNQ0QGVTzXTg0Vuk2w7XlDAAswu98EUmZPAmewEWN45LcHKsjOf
	EpQq4Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqj1qt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 06:02:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cde75c957a7so1870681a12.0
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 22:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795500122; x=1796104922; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SsfcmeOTukl7/t7yQZVfnisPQQJg5RQQ9zI61Zt5Jo4=;
        b=Ov3xgkfCKNA/k6BfcbbLvIfH5eqxE5jFqbAUki+9A9f/qNw2c6+XeVexgXZc0TdO/c
         +CR/PqxGym8iD9mPTzLxJtoMV5dBCuBLVswl7gfC82nCpI4XE7gOc2sju5F//D4pbC6X
         0bMbEVepkjCoCVtKj8onqXMJuwF8DvSUpMA4PBU8n9tnxaVUI5UhzPnIIBthjsJ+uwT+
         fgt+QO2Nn6pq7ctD3+jK2ZToEfQw4an2tTtS0OvUMVKL079hk3fqZ+6sLCvnLLfyx9F6
         YJsxOHwGoQsNijDNs3nQHcUEZET41TfVfzZMj7RFwgnkY+EIe30kWI+XlNZXNvgihdaO
         kOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795500122; x=1796104922;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SsfcmeOTukl7/t7yQZVfnisPQQJg5RQQ9zI61Zt5Jo4=;
        b=eaGZE6655mb1uhyFpZJg7oc5EUDBJvICif5fHJeV9D+grBLfIfKlu9OD/3QI7aQNR2
         lpqlw4hcLEzPFoLAPSA3kAyQ89nznaCm2FlovCISRqGjp6YbNkgszfRqvsP5+X9o08yn
         imvlRWODg9b8sP/BkMZ1HWqs6v3t8C2L7DqJE1qO7yiNYJvVdBjGYs3SLG0qwYVsius+
         BxQ06S7r931e3CMp81CGq87M+2ifClAvheA6P31Zwq6uwjXq4dLir0O1RWNKO644JZvp
         Yr9g3g4qM4FFLg2ajo+Da18+PvIfq/FuboR0d4rwOAfWEgHozjYT6KsHlyGIy0dqn42+
         iApw==
X-Forwarded-Encrypted: i=1; AL+hErE3uuLo4oKK1pK1losVSSTOZiseqPcEa/f+jsKXpcpe+YDAe9SqDME8g5P7GUO6ITA0XK5L6m9hwnQLAS/i0g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/aN7gtCxDgwaMiF+zyLJsXTyf6Fh+sYZtg5JF4xfonWmiBJDFd
	7a3Of5m1/YZOD37GV8pSahEYpJPYFTNfuWEETSpRoIwf13dXUo4Ylo/42B0ZhW4OjRupo/fnrz7
	gU9E6tMpNhm1i3k7upOW5XQ1LT0guehXMLKTTGMymkVfSRQ4B1HUr2KL1vUp0qHHCuJ4keg==
X-Gm-Gg: AZFdTZcuieJ54+Rg3h3WnBO0+zCkepV3637BZqOUPWFFh0mIBnf05SHny5uEsDmOUzE
	MJoknM4c55qJQ/y2H7xH3a8G5ywlo/oCShoB3eJpWHa47mObEbklPBlLWcMwXVSBvd7Mt0Q/5is
	43Zni4HFwT8tSFhBOVOFUQSqf7zah5F7Oa87/Yppo6XjpwzaaUbI9xP1RjSCcXN5gIhOC8Nknnj
	fIS/syWtQpCR632Vy9oGFB9bFy+2ZM+QPigD9V4/kdPIgmAX+D18jLflRqrzJSx0FOllweeTF64
	xsHl6XtIG6LgW4svx5RoICFQqLWdxP+RDS+NNkzvY0Fg4LSv6VfACxWXtsORc5QisTt37WpATL0
	c+ItKC73azp+3WqeGPnimcVOwkhnNI1fwRiLP7kAG26YuYU8ToWkWJ1dOpLTypAi/6GRhrhYLsL
	ZXvL3oV9Znc/Y5xG/7odmlqMREmDze/y0yMyL8+oiy+AEs
X-Received: by 2002:a05:6a21:8281:b0:3f8:f792:236a with SMTP id adf61e73a8af0-400ae723d45mr11885371637.39.1795500121971;
        Mon, 23 Nov 2026 22:02:01 -0800 (PST)
X-Received: by 2002:a05:6a21:8281:b0:3f8:f792:236a with SMTP id adf61e73a8af0-400ae723d45mr11885356637.39.1795500121364;
        Mon, 23 Nov 2026 22:02:01 -0800 (PST)
Received: from [10.133.33.98] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde9bb05981sm1190320a12.26.2026.11.23.22.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 22:02:00 -0800 (PST)
Message-ID: <d34b81a7-8dca-4975-b77b-a0344451f25b@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:01:57 +0800
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
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
 <43452750-2fff-46f7-bc61-2f5547602c85@oss.qualcomm.com>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <43452750-2fff-46f7-bc61-2f5547602c85@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b05285b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NcXVdgLmtPt-1cCCkIwA:9 a=8HErtrsoAFtHdO34:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyMyBTYWx0ZWRfX+bw/B/FB/Wp+
 AF6Auq2/s9nOQQwO+h8P0WFe95YYwTkl0TKHE23g+HdgAliqY5sA5udYZwg6SKmlHEMZFOvzWk9
 PfbK6haio5Oj/Ex9wfHrIy9klfnheE5H9Ztg/a2LSEAbrLOW798Mu0wwCKcBLlnKtOdCRDeiHmK
 m/Ezb1IVxxhqyZYJu+kKl3syJAvwByELDnAALTCQZ91aUl7BsaBpxv952r4nXd1RsATlGGalZGX
 3ExZ0D8Pmcbq7w3FDZgl2+slbSQzjusnsR6/ipOieka9EOYXDKLPaPU4YOUWAkUvamlEdbRzvX1
 OA3oNqWMcj0LW2z1FvQ9u9pvNWvCaD6Q0C9Z+2bMkBAFAuAnwIcqFd9Ax4+5Eox/objS8S5Nmjd
 VJxVe5kiqEbjIBKVk/2c+ARNVz4+S+9kEUTq3J1V67zKyAI6AIxUJqGUci7g7DGjJvBRvPBLvc8
 83zagSaXzxgpCc/ebAw==
X-Proofpoint-GUID: kaM0U8N8xT9hJx8LI1KfoqrWXjjbzuUH
X-Proofpoint-ORIG-GUID: kaM0U8N8xT9hJx8LI1KfoqrWXjjbzuUH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyMyBTYWx0ZWRfXy0FIhZfpXX0v
 Q8sM47rDQG4RSoS0auV7QyEPk4SJWPDRycS2GoGICGRGCf48nboXIjmNCYB5M+PF1hSzIUiZAwE
 mMZaxkfGEQ7M3OkdnJWKtzN8QSGlQSA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240023



On 11/21/2026 8:16 AM, Jeff Johnson wrote:
> On 11/17/2026 6:55 PM, Miaoqing Pan wrote:
>> mac80211 calls drv_change_vif_links() and drv_change_sta_links() for
>> both valid-links and active-links changes. ath12k does not distinguish
>> between the two, causing WARN_ON/incorrect teardown in change_vif_links(),
>> inconsistent vdev state in the chanctx callbacks, and silent
>> firmware miss in change_sta_links().
>>
>> This series derives link object lifetime from vif->valid_links and
>> sta->valid_links, which mac80211 updates before calling the driver,
>> instead of from the active-links sets. A STA link vdev keeps running when
>> its link is deactivated. The active/inactive link state is programmed to
>> firmware with WMI_MLO_LINK_SET_ACTIVE_CMDID, sent to each device that
>> holds vdevs of the STA, and only when it differs from the state last
>> programmed.
>>
>> Patch 1 adds WMI infrastructure: the response event struct,
>> WMI_TAG_MLO_LINK_SET_ACTIVE_RESP_EVENT tag, and the event handler
>> registered in ath12k_wmi_op_rx(). The handler only parses and logs
>> the event at this point; delivery to the waiter is wired up in patch 7.
>>
>> Patch 2 sets CTRL_F_OVERWRITE_FORCE_ACTIVE_BITMAP and
>> CTRL_F_OVERWRITE_FORCE_INACTIVE_BITMAP for FORCE_ACTIVE_INACTIVE, so that
>> firmware replaces the force bitmaps instead of accumulating them. It also
>> copies the AP MLD address into the command, and fixes the
>> CRTL_F_DYNC_FORCE_LINK_NUM typo.
>>
>> Patch 3 fixes ath12k_mac_op_change_vif_links() so that link vif lifetime
>> follows vif->valid_links. A link that is only deactivated keeps its link
>> vif, and a disconnect (valid_links == 0) removes all remaining link vifs.
>>
>> Patch 4 makes ath12k_mac_get_vif_up() skip links without a channel
>> context. A deactivated link keeps its vdev up in firmware but has
>> released its channel context, so it must not be used to derive the
>> target pdev. The WARN_ON() in ath12k_mac_get_target_pdev_id_from_vif()
>> is kept.
>>
>> Patch 5 stops clearing is_started for a STA vdev in
>> unassign_vif_chanctx(). The vdev is not stopped there, so the flag now
>> keeps matching the firmware state. assign_vif_chanctx() then compares the
>> new channel with started_chandef: if it is unchanged nothing is done.
>> Otherwise the vdev is restarted on the new channel, or stopped and started
>> if it is not up. Station removal clears is_started once the STA vdev has
>> been stopped, so that a reconnect on targets with vdev_start_delay starts
>> the vdev again.
>>
>> Patch 6 fixes the bounds checks in ath12k_mac_mlo_sta_set_link_active().
>> The vdev_bitmap and inactive_vdev_bitmap arrays are sized by
>> WMI_MLO_VDEV_BITMAP_SZ, but the checks compared against
>> WMI_MLO_LINK_NUM_SZ. Both are 2 today, so there is no functional change.
>> The checks now use the constant of the array they guard.
>>
>> Patch 7 makes ath12k_mac_op_change_sta_links() create link STAs for
>> sta->valid_links that are not yet in links_map. Link STA removal is
>> still left to STA removal, as firmware does not support it. Once the STA
>> is authorized, a link holding a channel context is active, and a link
>> with a link STA and link vif but no channel context is inactive. The
>> result is compared with ahvif->fw_active_links and
>> ahvif->fw_inactive_links, and WMI_MLO_LINK_SET_ACTIVE_CMDID is sent only
>> when it differs. It is sent to each device that holds vdevs of the STA,
>> with that device's links, and the driver waits for each device's
>> response, except in the INACTIVE_LINK_NUM case, which is sent without
>> waiting. If a device holds some of the STA's links but none of them is
>> active, the update fails with -EOPNOTSUPP. If the device crashes while a request is pending,
>> ath12k_core_pre_reconfigure_recovery() releases the waiter before it
>> takes the wiphy lock.
>>
>> Patch 7 depends on patches 1, 2, 3 and 5: it needs the response event
>> from patch 1, the ap_mld_addr argument from patch 2, link vifs that
>> survive deactivation from patch 3, and a STA link vdev that stays
>> started across deactivation from patch 5. Patches 1-6 each apply to the
>> base on their own, and the whole series applies in order.
>>
>>
>> Miaoqing Pan (7):
>>    wifi: ath12k: add WMI response handling for MLO link set active
>>      command
>>    wifi: ath12k: send overwrite flags and AP MLD addr in MLO link set
>>      active
>>    wifi: ath12k: fix ath12k_mac_op_change_vif_links() for active-link
>>      updates
>>    wifi: ath12k: skip links without channel context in
>>      ath12k_mac_get_vif_up()
>>    wifi: ath12k: restart STA link vdev on chanctx assign if channel
>>      changed
>>    wifi: ath12k: use WMI_MLO_VDEV_BITMAP_SZ for vdev bitmap bounds check
>>    wifi: ath12k: handle MLO active link updates
>>
>>   drivers/net/wireless/ath/ath12k/core.c |  15 ++
>>   drivers/net/wireless/ath/ath12k/core.h |  25 ++
>>   drivers/net/wireless/ath/ath12k/mac.c  | 335 ++++++++++++++++++++++---
>>   drivers/net/wireless/ath/ath12k/wmi.c  |  54 +++-
>>   drivers/net/wireless/ath/ath12k/wmi.h  |  11 +-
>>   5 files changed, 405 insertions(+), 35 deletions(-)
>>
>>
>> base-commit: 4016f6c3149e7e3faccc1654db6a3030c069383a
> 
> My review agent notes there is a pre-existing issue that isn't addressed by
> this series.
> 
> The review:
> "file": "drivers/net/wireless/ath/ath12k/mac.c",
> "line": 12683,
> "summary": "arvif->is_started stays true when vdev_stop succeeds but
> vdev_start fails, breaking the firmware/driver state invariant",
> "failure_scenario": "In ath12k_mac_op_assign_vif_chanctx(), the !is_up
> STA restart path calls vdev_stop (which does NOT clear is_started) then
> vdev_start. If vdev_start fails, is_started=true but firmware has the vdev
> stopped. started_chandef still holds the old channel (vdev_start_restart only
> writes it on success). On the next assign_vif_chanctx for the new channel,
> the same-channel check (line 12673) does NOT fire since
> started_chandef≠ctx->def; however, calling vdev_stop again on an
> already-stopped vdev hits the num_started_vdevs=0 WARN and corrupts the
> counter. For the same-channel case a future assign_vif_chanctx would silently
> return 0 without restarting, leaving the STA with a dead vdev in firmware
> indefinitely."
> 
> My refute agent concurs:
> is_started can diverge from firmware on a failed vdev restart ·
> mac.c:12667-12693
> 
> Confirmed the mechanics: ath12k_mac_vdev_stop() (mac.c:1556) does not clear
> is_started, and ath12k_mac_vdev_start_restart() only sets
> started_chandef/num_started_vdevs on success. So in the new STA restart
> branch, if vdev_stop succeeds but vdev_start fails, is_started stays true
> while firmware has the vdev stopped — which violates the very invariant this
> patch introduces ("driver state matches firmware state"). A later
> assign_vif_chanctx for the same (old) channel would then hit the
> cfg80211_chandef_identical check and return 0, leaving a dead vdev.
> 
> Caveat on severity: this is a firmware-error-only path, and it exactly mirrors
> the long-standing switch_vif_chanctx() error handling (mac.c:12007-12019),
> which has the same gap and clears nothing on failure. So it's a real but
> pre-existing-pattern concern.
> 
> I also concur with the recommended action:
>   — worth a note to the author (clear is_started on vdev_stop success / after a
> failed vdev_start), not a submission blocker.
> 
> So resolve with a follow-up patch if necessary once this series lands.
> 
> /jeff

Thanks for pointing this out. Agreed, I'll address this separately in a 
follow-up patch.
