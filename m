Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302457;
	b=EqysU9EhmXtMzNDAEwtdEFanYK8jWISsva/hTTqz/M5AoRlgucCqjoENcyNKfE2hTGNg
	 +REw6TR0A9KaWPTyBLs53U/v57itiWmqtOgMMLwFtxYayDLQUUrjVA5yeKy0bfjj7BcWe
	 BZrQ9NMfCKWlPwGHDYGLoUBATYbdq+GMFn8kU8dqWrFeejiiSr7RtPZUr0NSWipJnXsTr
	 QuHewHhsQKOs9G/a3aLm9LoyIBxjyHT+ERDNCMDUvKkj0wBWHMophopi9WjM3r0XRo4+5
	 MZhKKb7qguCAxa0BzOmIWxN+2DmarmQq/fBU4dOP0bYKAifor4/yjtloj++dgnwzSAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gI3U6dUlp30v59HKfCtRqIsiBkmd37Mua00ns5/+cmw=;
	b=b7u6jyrexshE74RccOsU8qesQcUrA7rlMhLnMp/DSskGui2VKyBF55WtB3zVhEJeHI/F
	 5ZaGqkcAEshVfMiPFuidZTr2uLVD/t1VKwugBKITBxeFlnll5/IT+akN37u7SQwjysW16
	 pPRecz8GpagNOgelXpeSBljIaJteUHgc8w8Ow6Pv4RhHqynex4EHRAuKUVepZBVJ4/jH4
	 KeKzad7APBi4dBTNGSPFNmJ/ttvSjOz9Voqbkw8KV7tu5pZLLHkipZCO/YQyanw4n4P82
	 BeRZsmYXMHOThPEmejOm2oJc53sdYxnBEVSzHwAicBfkSSfl/SZagdq34t3AMod5YMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=AKZubi4o;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4286C606A33F
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 23:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4286C606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=AKZubi4o
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c516a574bffso21143966b.3
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 15:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302455; x=1795907255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gI3U6dUlp30v59HKfCtRqIsiBkmd37Mua00ns5/+cmw=;
        b=AKZubi4otobKsA3C7KNDJTnh2xGTU6QkmoaLoeya3i0adiyTgnlv/EAJdwbueF2IYQ
         C9ChBOEaPMStkaQe4K/JWdNFSSdc3t/XjyZJdagWdnM6VjOlSGbYa/dwyHkfDuxuCJRF
         3Tf++Hn2NFeU8zgvkjtMKTD+KHlly8/2vLa1aiVtSZp7kd6peIjTKroQVeMKQ+1xEnRs
         0Y9uAPRtWvTMMI0cGmKetxwHQViblVZDN+8HfcyNB2ctGfnZvzDn2HXFkYmwJ4h20Um8
         LfMpDTgZ1s0BeqOoZAb0s8+5h4WtN0pw+oUh3/Y44NGLBU4GLcKbskB/zCI9f0tkpZoa
         kWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302455; x=1795907255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gI3U6dUlp30v59HKfCtRqIsiBkmd37Mua00ns5/+cmw=;
        b=0ddnR5sg/86bo/GzbBEuGUovmTJn+rw/tafHy1ndVJ0bP3YOw+jPhdru/ZOqgi1J7z
         mCzLAonq+iBs+Mqc47vyq4orjDstWvxZwpsZfzpUOg19kEd57KR1xPYaJMcT9CnqizPD
         YApy1Wu4+vAPE0BpUzMk3F4mnkwgqqhYFyT0DjXvFrookurVgifLge7jgynKi9MOzpHd
         8I3A09vOuhTxbnbh+NuaU7byTlNwOamvJ78TuY1H6RyyCRufNnj6OgXdYuR/McsXtD7c
         KUh83a+Sm4TWv/Elr79eayM1U1UiaNTNARRmPpZv0Vaay9y/azSHDcjR9RTzPXsIxd+d
         p1iA==
X-Forwarded-Encrypted: i=1; AL+hErHNsp5Gqfx735VSbldh+KyaPUozNAZ9i7lFYmcjye+XI2xCuPHNuKtu8syyLAIX6768wwwBaPU5LXHWDTGjYQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/dVUTryl3gxnihk3SvOtbArFbKGbTUGxferH4nKCXSyMzFAGLh
	gWr24hPMHpsaC6TLMoNrHC3NeBUQzEY2qeZy87smp64eMBp10EsfXhzzjrq158qjbA==
X-Gm-Gg: AZFdTZcrShZ7LrkhwgikHaQjXpp/0Tz+MIAlQz4yD/6AXblZtLw9gdd0jjUvjl4hLgs
	YuVVeqBA0Ws8jRU7cGjsTFiu5tBqh02LMjKJtLS3YXQVfct7IphzO1IunB4gHaLiFtZGfLIe1xT
	0DUgXrmbZLSr7RDWj3ZfZptE8mXmEPBi4Az93LyUWDYhirlvg5mdAmZ5vtgPupvObX0CNKsx1zg
	EUulYPFYf7oHsHcb3iybRrFNZe9MVUhVxmAZY94Ir36UQj4TIMLojBUsNryPrprDd4mYbcq6t8v
	BAj9zAS98KVFrGe9dRcl7YHpmXHy1WbD4Je/izLcuFQIoiw1mzlE3xCTfP3EVfyTF1ewyb6YxJp
	XAaGAuLWHpFcp6Onkt6MUCuYISQNt+2Fr5EaBGh3FRAuyCzRThkDmi6cz6aCKEgsWqQ3M56D3UE
	ssGIZIU7d02Fxu5ZSC7ap9J8I9RJH4Nsjg/VU4DYVFWj/D/R9NAsm1CQJjqWTSVFwoMLdg74d2y
	XF7FTXODcM6BH5BmvKbNdLjWXBFTLq3z50sYGQjvfwMnzA6N4dcvNHBZMZH8LpRdeYfLd0xW/oF
	E2xUpywIk9iO60LzlRHHUhqMF2TPx7u1U2m0I+ahvl6wX2OIbIBO5yex/JdlCo+vJQOLEMygV5j
	cI7G4emc+9PfXG+fD01Z2mBl0qnXNvk1yeset53qGV4lsaLBTIW9jeKMD0cnTVOJXYapfJPibe+
	NQ8eh3nStRKrIKKFiQ212LiTNxOK0j6AaaXGFdAVk21jjPvxMXaipGET6u0c/5KH6FW2UFhRjUp
	fVFvs3IcDgRl/zpzqyFQI+bl2vlNWd68wCv70ZyynpaV6luS+0CnL5HvbvU0+TCvwR0y8OJitfM
	c0iVEKa0PBHK7IQgHdXo5dpOD7XwP4L9iKC35C4qGm1c4iRWUnMT71iuGgFzVfrdhVD5BdudYQc
	=
X-Received: by 2002:a17:907:d406:b0:c41:8e21:4d5a with SMTP id a640c23a62f3a-c513a47e37fmr603561966b.5.1795302455657;
        Sat, 21 Nov 2026 15:07:35 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:34 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Maurer <fmaurer@disroot.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	Jiale Yao <yaojiale02@163.com>,
	Julia Lawall <julia.lawall@lip6.fr>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH ath-next v3 01/13] wifi: ath11k: initialise the CE descriptor waitqueue once per device
Date: Sun, 22 Nov 2026 00:07:19 +0100
Message-ID: <20261121230731.1206043-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121230731.1206043-1-julius@bairaktaris.de>
References: <20261121230731.1206043-1-julius@bairaktaris.de>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware crash recovery reinitialises tx_ce_desc_wq in
ath11k_connect_pdev_htc_service(), reached through ath11k_core_start()
and ath11k_wmi_connect(), while a WMI command on a device without credit
flow can still sleep on it in ath11k_wmi_cmd_send(). finish_wait() then
unlinks the waiter from the reset list head:

  list_del corruption. prev->next should be ffffffc084293648, but was
  ffffff80075109a8. (prev=ffffff80075109a8)
  WARNING: CPU: 2 PID: 1782 at lib/list_debug.c:62
  __list_del_entry_valid_or_report+0x134/0x174
  CPU: 2 UID: 101 PID: 1782 Comm: hostapd
  Call trace:
   __list_del_entry_valid_or_report+0x134/0x174 (P)
   finish_wait+0x68/0xb8
   ath11k_wmi_cmd_send+0x150/0x2f4 [ath11k]
   ath11k_wmi_vdev_set_param_cmd+0x64/0xd8 [ath11k]
   ath11k_mac_op_bss_info_changed+0xe8/0xf6c [ath11k]
   drv_link_info_changed+0x128/0x180 [mac80211]
   ieee80211_link_info_change_notify+0xe0/0x100 [mac80211]
   ieee80211_change_bss+0x1bc/0x250 [mac80211]
   nl80211_set_bss+0x1a0/0x328 [cfg80211]

Initialise the queues once in ath11k_core_alloc().

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: f951380a6022 ("ath11k: Disabling credit flow for WMI path")
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Tested-by: Florian Maurer <fmaurer@disroot.org> # IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146 (backport to 6.18)
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: no change.

 drivers/net/wireless/ath/ath11k/core.c | 5 +++++
 drivers/net/wireless/ath/ath11k/wmi.c  | 1 -
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 766ae27306f4..8e4dab61a300 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2743,6 +2743,7 @@ struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
 				      enum ath11k_bus bus)
 {
 	struct ath11k_base *ab;
+	int i;
 
 	ab = kzalloc(sizeof(*ab) + priv_size, GFP_KERNEL);
 	if (!ab)
@@ -2769,6 +2770,10 @@ struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
 	INIT_LIST_HEAD(&ab->peers);
 	init_waitqueue_head(&ab->peer_mapping_wq);
 	init_waitqueue_head(&ab->wmi_ab.tx_credits_wq);
+
+	for (i = 0; i < ARRAY_SIZE(ab->wmi_ab.wmi); i++)
+		init_waitqueue_head(&ab->wmi_ab.wmi[i].tx_ce_desc_wq);
+
 	init_waitqueue_head(&ab->qmi.cold_boot_waitq);
 	INIT_WORK(&ab->restart_work, ath11k_core_restart);
 	INIT_WORK(&ab->update_11d_work, ath11k_update_11d);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 82f85df481cb..5f2412982229 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -9102,7 +9102,6 @@ static int ath11k_connect_pdev_htc_service(struct ath11k_base *ab,
 	ab->wmi_ab.wmi_endpoint_id[pdev_idx] = conn_resp.eid;
 	ab->wmi_ab.wmi[pdev_idx].eid = conn_resp.eid;
 	ab->wmi_ab.max_msg_len[pdev_idx] = conn_resp.max_msg_len;
-	init_waitqueue_head(&ab->wmi_ab.wmi[pdev_idx].tx_ce_desc_wq);
 
 	return 0;
 }
-- 
2.53.0

