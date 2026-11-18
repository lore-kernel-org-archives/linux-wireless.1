Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015849;
	b=HkpFGnYmeguWtu0jSdHW9JvahpQG8qIcMZdpvst5MUojzrcmLNzsTTCa8VG7qlv7Z8ji
	 t2k92cTCboPblMpavs3yh1f5Ex1sahGfMCUZHXFsqiJF5OalB67MKKYrfG2JJwPnb+bZU
	 4VCI71VcirJ54rvpd5hrPvhPgibpobDc5Tv1waKWds84xydkJjBxh2/vDaPEGM+0gwfOS
	 YFHhjZFHtS8AcmPS4qye4VmAPKysKVeonxl00j9fLQohY46SoXQ9lF37uWLnuAinQym3D
	 eRJgzo70uYmc8mZJaWFjX2w2FDpEQEpmvpjp9xelJBI0enyliF34xLEjTHwwWZY+hfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SziJhar8ezshKnKHhp+CUMmzVZySSfbjzN+eVLHeQo0=;
	b=Ko2qrG0jJXmJRqbMKeEhUM0tphe6aOlIl5R7NdddFvofjQOnB3Zrx8MjPMeQoAkC8YxS
	 lJOmHMNxO7nMtLZpMTpF09npV0As2Wbjh1xwLGmtgPy7mjgSo+DghohI1oHn/wdhNvJoV
	 nUkxVpLBssK8A8mKpEAEaFAKhfdhBHwWIu3dO7vaCe0phDgn2Xx6Fz15dqFxjrtLssdFu
	 7gb3QPGS4zESPaEriLwEg1vR8nmR1p6hPzfHYUuTJwxDD9YSnB0r9yEpaSS2QCbDPgnXA
	 GPQCeOz7DDmUUw1JdZXj1YsYyaO/MvilNvyZK17ODef1ASOZ75cjf1LVnfInNK3s1+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=coRyIDaM;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8B6606A33B
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 15:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE8B6606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=coRyIDaM
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36dbde64409so2099664eec.0
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 07:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795015848; x=1795620648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SziJhar8ezshKnKHhp+CUMmzVZySSfbjzN+eVLHeQo0=;
        b=coRyIDaMOQEFVbLhQ1on5tKKR/VGPQUOYduGk91znhHifaYLMi5eQlgPpyvE9XbfO8
         /7bXVF3SjPkBWyEfqc8A+DyDvf3MT5zpceYvRherOdYjb3kZYJjzjWRJq2Whdb2BjG2C
         eG2mGvKd/C06IrnNGyPey/8P+aQujQRZ0r4MYliul53hr6fB2dg7OEER1WD/1xe+Nqr/
         gBMCaP7xjg/bwRt6vVARSjNSkkxk4qeMdrvgGSXAX28/B5UbzkEXwmBc6VsCM5xbzs8N
         dHQqXz7D2u6MyKUtY0VJoD5TTWGwEcO8v426PFMsn1sRQ2oHdALcTQzcr5ddvt4CQ//9
         qZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015848; x=1795620648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SziJhar8ezshKnKHhp+CUMmzVZySSfbjzN+eVLHeQo0=;
        b=uDqex6IQcXi6bCcrIkyMtGHY30L2i+TrFZnKZVpjG2G8IXCx8BUFCHDTRZ/K/plIN+
         P/OE4gz3ynLTv34Y16GcKoeu0T8cgSM8Rc9B9czzlmsig6Xmc11FJVP2l7MJGMidtcoc
         Dj3sOj+d8o9INpZp61Ah3qDwxIKAvsi2siUMGjxq+IuuXIn7oniSqgMc+qnZo/jRza4z
         TaR4QCfrWb4HMNNj+/Zcjj2fCFPPQiLSN8hvNdj7KFyBDJH5Ey6utezkwryIEo7l2o7h
         klN+rfuM/YW6W/GhZrSjd1M9CjPn6z+sqjaZZ0ItYDvzkf7KooV9n1V54HPOJJ+LcslK
         OuZA==
X-Forwarded-Encrypted: i=1; AL+hErEuiW7TIu+U7siMixbHZ2aCVU8CPNasO5+tIH7hrOdEWYhg00oDaABRBMSyRnR4DxwWwCd63ScDHl1793cc3g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9qvUiMplG3LzszfFs9BZtAGpjPxuughsD2P0pqqQM+ZqE8K2co
	9nvLB9m/IzCA9y4EYPZ8uj5Qoo6mow24XBKplcILZJyexnq4aqx2tNmW0MSuD/pExqw=
X-Gm-Gg: AZFdTZdPN7khQDTFjt8DsXWTYqS/S3fkLEvqCTLGlXhdP6SQJ3tLh0xYnb41DZlu6/r
	gYpMer0KGNqNkZPH4SQNuJpVIZ06P0qiwovQNvKFWOyV+/x3w1LotUXqcBe+OxVM28t4WpBqxIy
	dq7U6eEL3A7vAo++OsP5fiV3zZ7mbPzOQ/52hf/t2rgJOmqwq8S3AzZVnXVIBuZ/DM9NVPGxYlI
	Q20ZaHzGHZ6xitrWODPcHsRqtKf6Kk7iR0XfAEepX2PCcy+PwwoKftz0Y9IlTqgVVWGYb+jH/5K
	p5gTMuhHzTmbCpk4fplVbnGjJQ3Zfs6zGhBpPkZrepnVDmKXSDRA4uXxy2K3L0RY9Q8YKIQipWy
	wJOSxuhGWR/cg9OX4jreAWtmS8Y+CxAfZAtc9/PP9O1zvUC+K/DICWz8eewAuhelrUTTxhnz7KD
	sjz1EPnCS4hH57thKXET/w3TOp2Seo/rhgm3+b2OlTLyXVQY8FPagIdf/m78KeROmccVTlnMlfJ
	YB0Z+EluXvNB6kunztS4Zxkt8UmHkHbeW+BPeSzZ8n/x/W5akBITVgmQ3XFtk3PZls9llnIRCb1
	NWDFlOhgtg1nNs41Qy1PxS6QvBD0TyxbxlK49ltcXY/mf+ouQd5RPRTdoM8=
X-Received: by 2002:a05:693c:69c7:b0:369:faa2:1fb2 with SMTP id 5a478bee46e88-3827f98a2d4mr2357647eec.8.1795015847374;
        Wed, 18 Nov 2026 07:30:47 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:2c16:ada8:2d24:d03])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a630517asm8922616eec.8.2026.11.18.07.30.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 07:30:46 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Wen Gong <quic_wgong@quicinc.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH ath-current 3/3] wifi: ath11k: keep the regulatory info store on a SERVICE_READY_EXT error
Date: Wed, 18 Nov 2026 23:29:42 +0800
Message-ID: <20261118152942.62838-4-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118152942.62838-1-enderaoelyther@gmail.com>
References: <20261118152942.62838-1-enderaoelyther@gmail.com>
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

ab->reg_info_store lives as long as the device. The first
SERVICE_READY_EXT event allocates it, every later firmware start reuses
it, the regulatory events keep the rules of each radio in it, and
ath11k_reg_free() frees it together with those rules when the device is
freed.

Commit 64828f091c7d ("wifi: ath11k: fix reg_info_store leak in
ath11k_service_ready_ext_event()") frees the store and clears the
pointer on the SERVICE_READY_EXT error path. When the event fails after
a firmware restart, that leaks the rules the store holds and leaves the
store NULL while the radios stay registered with mac80211:
ath11k_reg_handle_chan_list() then writes through the NULL pointer, and
the 6 GHz paths of ath11k_mac_op_add_interface(),
ath11k_mac_parse_tx_pwr_env() and ath11k_mac_op_sta_state() read
through it. The leak that commit addressed, a store allocated by a
first start that later fails, no longer needs it: ath11k_core_free()
frees the regulatory state on every teardown path.

Do not free the store on the error path.

AI assistance was used.

Fixes: 64828f091c7d ("wifi: ath11k: fix reg_info_store leak in ath11k_service_ready_ext_event()")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Found by code review. Tested in QEMU with KASAN, using a test module
that runs a SERVICE_READY_EXT and a regulatory event on a synthetic
device and then restarts it with a failing SERVICE_READY_EXT: without
this change the store pointer is cleared; with the series applied the
store keeps the country code and the rule count of the first start.

No new W=1, sparse or smatch warnings.

 drivers/net/wireless/ath/ath11k/wmi.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 08fd6795ed9e..bbca275a8289 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5136,15 +5136,6 @@ static int ath11k_service_ready_ext_event(struct ath11k_base *ab,
 
 err:
 	kfree(svc_rdy_ext.mac_phy_caps);
-
-	/*
-	 * During TLV iteration the WMI_TAG_SOC_HAL_REG_CAPABILITIES
-	 * handler may have allocated ab->reg_info_store, so free it
-	 * on error to avoid a memory leak
-	 */
-	kfree(ab->reg_info_store);
-	ab->reg_info_store = NULL;
-
 	ath11k_wmi_free_dbring_caps(ab);
 	return ret;
 }
-- 
2.56.1

