Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164178;
	b=q+28GQqXEhi9+MK7+vgF12AZv+ArMVNlVCGGrgwA5UBVdquN3iV+k/6QKLNgvNhDDdLK
	 mcp04HP06pGex6nrWx6KbOyfsS252mPuUDzb4QGr3DxCAqUxs7BEXEVPp/YLAvaL/t7zN
	 R/gmv8fVaTb1s48aWkyh2JP1t6S5nb1Fghlia9ftBhrZcCFUvgYW8Pu76lrjVfXGazRg+
	 eWXwS/6flvvq8g9W6AwN9/WxzKBVQy/LXkWvm+lauIpWAcI9Csxhq3waTUUtF4NE0x609
	 dcO77FUi0B70hzbdi/8TzCySVC+64ZmpJJ1ujXmifNsH5A5kLpl8OCzpABuf9AYoJ7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164178;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=t6UM1y/KWtHHd0/uNRfFEFks1dVYieXXfq27+VcRjfA=;
	b=Zj5saK9p3q5QdIjmRZ800c4Up1um2VJh+32lIo7HkADYLygXkEijGPxyJ/9FafR+fT99
	 YKMBtdD+1keXHNxemhCU0QqYUDShI1iEqGuBQf0Qnh8G2uYnsD3zzkuiHIYiTcw7s/p/s
	 bpjxV5PJBApqGoapNephbg1CAijNmV//fZsiRmWKpRAV4Li7YKNMQmD1+m6Kw1bUFoTwf
	 nSSxye8jM8kYSM57t7ddCD97KKnTmifYRp5dpsa37fvOvTR2WZYA8L631HacjPfP+RvAO
	 9Eyht6SlWbPWugpMTXta8kbioerTwaoEkJcTZd4ynS97vCKAyYvxA/qPIpVBcLqVIkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FZPDyoMK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WGDTAHn2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD7F606B492
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BD7F606B492
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FZPDyoMK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WGDTAHn2
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7esbX2019469
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t6UM1y/KWtHHd0/uNRfFEFks1dVYieXXfq27+VcRjfA=; b=FZPDyoMK/qbktyBl
	W64Ib4x4qMGe65QsOc5Q2BqACOsqZYBtV2NVfrmUF2hdHIdcpzNoOhtIDX4kSogz
	uo+7hAtSPIW79K5OOGKsibJwnWqb3jQwiClzdrqXNczqGzPRIYrrNKbxShr1q892
	kg84zkjZbIR8dr4keKf2MP/rvYT8ylmtWA+/JAerBHJaoojJkInvQ55jEGTmN4uV
	hYP13tFjd8FkXRWOEQi+skzzjMRec/wNS3zGgx4A7RKzpZa7xNPZ4TPh2pYTlMNb
	ga6EgjCtomLIA/a1GA3VGexO9Clayvg/xNYB22a68AA8Ze6YRnMcUecBO0dhOJEE
	lAkfCA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj8vnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:42:57 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3724667bc16so489978eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 00:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164177; x=1795768977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6UM1y/KWtHHd0/uNRfFEFks1dVYieXXfq27+VcRjfA=;
        b=WGDTAHn2oxooq/EDQUj77BRXN0PEOYZ+LiIL+LcTVqOqJLOtFHNWC02f2riZH6qPzN
         l84jYGzDlVp3zB7k3vbNHwEulNtg9aX+1YOtpARiVWXnrZXqnXWO+eXMIJn8ACh338am
         ZSL0pNr/hJR9kybLoKH9TNhg8VFF+QxHwGaEYcZ6jZ0ZE52CO7l32NjNyHIK5rHJcFrZ
         Iv9VRutkegsnDQI12HwBafvGTgquqMXqWFmW2+aSEDZ5azyfy935wy2f9rSmh3FYbH/x
         uqFUXyJ0ohxSb9fk369sRqb0aK1OflaMAnAaU/d6pr8tvF3xprhMd+8a13OVhVyTIssw
         OgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164177; x=1795768977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t6UM1y/KWtHHd0/uNRfFEFks1dVYieXXfq27+VcRjfA=;
        b=avCkSDEBHHgDt6dRhZnayGuS8qqNSu06WrYgd261LYJA7zVrIQYSdoMea814idGyxL
         wY6T7xKPpathpM3t9GolOLn7wuWPsnk3izPMhhC5EMQoJ/RUdXvJfin2RzbqHbTzBDwq
         eOmfg30DNrpD/T9640tPWnlgvV0Q17xd0QiCzejHAaVb89bMlE/VF6YWuZFEntMaH4xH
         k1ykfQIkAvsaKs1UtQdk4p7Bv1Ra/Y792e9+3nkd04r0b/ltrl9a4pnItGGfzOKFlb1Y
         96QpDcBPxEPN+aBZZTxsGbtsTZ5VA/Z9IGvs//18NQjrPR+zcSuCjkzBhXSMsubi+yM+
         0OWQ==
X-Forwarded-Encrypted: i=1; AL+hErFbmW+UaB315ni8wl7cIsm3zCMxWn/JQeUtJQ24ku8Vai+iIAOrDEgeE4qoIE6E2yVBZMJ0RdlJ9fLMDgJQWw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/kvxjd/93r4Aw/tckqzRVBH2DBdaNJc70Z8O7ErvxX9KnhqHXG
	rCi77qyQacYR9JHbZKy/Q5uqhJPV4zNEv19gaY8iN8IyqewzZBl3jOId5fzPF7UkSHApDTa4bQF
	YxvYy1S4nUt1+YgkYjMKOmu6vRkCzGr/zGaGQFHoLt2sh6N95cqW4AsyBl57drUe2VlNX4w==
X-Gm-Gg: AZFdTZct3D+otz0zYqdWPpLVevHEtiKIgPp4RtJ/jzc2Npg6XZrj8M8wtCz/HH7nifs
	IRb8cBezK2r+dT69STHQeq6du0KN5Erqo3eJeFhSXSTfqlZBFoYa0wWTlHrvVlCBOE0+WJUkc5f
	y44VV8L8Z+8QyME8GNCjWBjLSzBA09YiEaTHxU1cEpN+oBKYwjtX2qjkFZ0JBI3eqslpuwVyvnS
	72GgbuHrESyMBx/9opccQOkBmT0fgWrfjfZL5fj9VRxRHiD0nao/aQ+RnIZ8841ytbXRfXOA6rq
	uLCN+yFhwof4whHXskmGci+SL4TfSfxYix3YjhVcg0IUfzr4Z7h5BOUj0kRhwHSdPYRuqPxhJyr
	E8exPJ3Zg63zCTstiysOA6iHEi8vJzwrr2t7eewL7YEKZ0jSwt9YsDp4ho/CgmHYcTJPehqA+qU
	/9m6JL0dZCF9GrAf37jrXVHS0=
X-Received: by 2002:a05:7301:188e:b0:381:685a:e1ee with SMTP id 5a478bee46e88-384b3e78a26mr3649589eec.12.1795164176727;
        Fri, 20 Nov 2026 00:42:56 -0800 (PST)
X-Received: by 2002:a05:7301:188e:b0:381:685a:e1ee with SMTP id 5a478bee46e88-384b3e78a26mr3649570eec.12.1795164176217;
        Fri, 20 Nov 2026 00:42:56 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:42:55 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:29 -0800
Subject: [PATCH ath-next v4 04/10] wifi: ath10k: also wake remaining
 blocked waiters
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-recovery-v4-v4-4-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=3115;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=xYQJfPHtqX9vuxRlxr/c5QyrNSA+dqNPa2wUFMiopAk=;
 b=owhOCcr49FGFhwZPYvjUG3cGjpX6+180EF2O9AiSsCeEhXZWaK6s3h7uiI0gBGBEU3wZNo8c8
 uSNP3QYre7yCWkhCp675zLgLBKY35xnh+dssyKLB1fjo8Q28up6pcpw
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b000811 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IOUMnZVgalWeg46eWFIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfXwqR4tdIespMI
 fdOCtU0snCJyiTkTeLZAkOeRvZTScdLYiN5DkaKRIiZr3mrLIK+IvapR2zlO+Q1glQE/E/oe3WN
 iuoJKPUl9p9aOK5lVRdQH+oW7Xs8tGg=
X-Proofpoint-ORIG-GUID: w05oJC8gUPyMJeimjojKws8w4XQQrWZv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX3xqzrzScJp9L
 OodkIau1jDXBbLp5ISm46EinoZ3ic50QflIgsCOJd1DQB/B1WcQWDLWwtJ76sOF2p4XXuggI/lp
 b6e7xNTJtsd4oXOIYKF8CtS6s6ZDwPH8NHFdtlDHG4VC1cu5Zq4y5qThaIJpuELInn6ZeXsdCjC
 oq5uh6eQIBvwe45lDUerX9gvwdri/7JcQEftwYGjSgE44rkK2wnqY70C/8u2uAbtDtpV+UPvaaz
 ncFtjc4c3xXZDIBHoiFb3BY+m3MA+1dq26RIHL7uNMO3FkGUyeZEI6lktRgbPhCRuXqBzWahGPj
 TbCCaWE3meJClDt5imR8IZiAbuJCZlYSdXLqRYbswzo+65D1TPYV43xN3cX4B8pDMZqn78FBWwa
 qGnQwJhL9+WXzf9QTg8DRbcBKbuUvxfTcj4F4mOqlrHr6wtTGs2sO+Im3zC7/JLL1Nrr//3inJS
 8NvqXXQ0qTogIT4TPaA==
X-Proofpoint-GUID: w05oJC8gUPyMJeimjojKws8w4XQQrWZv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200034

ath10k_core_wake_all_waiters() still misses several completions,
leaving their callers blocked after the driver has given up on the
device.

In particular, callers waiting on peer_delete_done, target_suspend,
wow.wakeup_completed, peer_stats_info_complete or wmi.radar_confirm
continue sleeping until their individual timeouts expire even though
no further progress is possible. The WoW and suspend waits are on the
suspend and resume paths, where these delays consume watchdog budget.

Add the missing completions to ath10k_core_wake_all_waiters() so the
callers are released immediately.

peer_delete_done is not otherwise reinitialized before every wait.
A completion left signaled by recovery would therefore make a later
peer-delete wait return immediately. Reinitialize it before sending
each peer-delete command.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 5 +++++
 drivers/net/wireless/ath/ath10k/mac.c  | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 3bb4d2742c30..99960f12dc66 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2542,7 +2542,12 @@ static void ath10k_core_wake_all_waiters(struct ath10k *ar)
 	complete(&ar->install_key_done);
 	complete(&ar->vdev_setup_done);
 	complete(&ar->vdev_delete_done);
+	complete(&ar->peer_delete_done);
+	complete(&ar->target_suspend);
+	complete(&ar->wow.wakeup_completed);
+	complete(&ar->peer_stats_info_complete);
 	complete(&ar->thermal.wmi_sync);
+	complete(&ar->wmi.radar_confirm);
 	complete(&ar->bss_survey_done);
 	wake_up(&ar->htt.empty_tx_wq);
 	wake_up(&ar->wmi.tx_credits_wq);
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 74aca0af11c8..695df1821e5c 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -843,6 +843,7 @@ static int ath10k_peer_delete(struct ath10k *ar, u32 vdev_id, const u8 *addr)
 
 	lockdep_assert_held(&ar->conf_mutex);
 
+	reinit_completion(&ar->peer_delete_done);
 	ret = ath10k_wmi_peer_delete(ar, vdev_id, addr);
 	if (ret)
 		return ret;
@@ -5897,6 +5898,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 err_peer_delete:
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
 	    arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
+		reinit_completion(&ar->peer_delete_done);
 		ath10k_wmi_peer_delete(ar, arvif->vdev_id, vif->addr);
 		ath10k_wait_for_peer_delete_done(ar, arvif->vdev_id,
 						 vif->addr);
@@ -5959,6 +5961,7 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
 	    arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
+		reinit_completion(&ar->peer_delete_done);
 		ret = ath10k_wmi_peer_delete(arvif->ar, arvif->vdev_id,
 					     vif->addr);
 		if (ret)

-- 
2.34.1

