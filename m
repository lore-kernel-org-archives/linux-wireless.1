Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026957;
	b=5thRpB6DI8KVcwTKJXyfzk+vNqlpCV8oyJu/PtOg0lv1cg1ou5+R9Kbr1bZgVRpmhxiR
	 40P6yn5ABCmICLB163nmcghfXWh9b/ggMih37jbRLQcG8kgnzMkTtq3fJK88jT84eQXpy
	 bKUb1NQzAFaAEWLADZvFr7oVoikdyDX/rI8PL/UqoS6D6lanfKR/Th+dhhm0RrG6rW1UF
	 AFMg6pHuIGYxpkR7il1nJWHFGAmZZgtoUdJqN1kvvhFgKqjptvMHJBkWY7KHCHNjG23HH
	 eIeNhX3drA5087Wm8NO3TXjbV9kb0W/5Y/a2Gg0jijIS4p5rg02lEG+XV6FJ32BuxiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mP54NqX1yA2UP7uMr6LAS3zfC46Nx8rGJsFCoNbtzuw=;
	b=rtUNJv/TXCMsk2+MK/wBeWntss17AZ1kEG8/vl2SXb4FB54dyXITDr9A0oAVV5mLUtnL
	 6f2JuHeinItIc6mQ1w5tRS50D5+B1rQtGh8Qa7kF1sropsgewW4M/8p/Lk7LWSABK+VH3
	 zcKrGduyXm57i/6UZQbbnSFWAETZavE+As83wgwXK8pxjvzEiSQfj9RRWReLe/PPq3KmQ
	 OdV8KiLNZYbe/1m2zjhJt+x0WtlNw1JjlXMGlmBIS0LbfCFsR7tupG2PpyZc6A0aNNSZ+
	 dmWhG/5PbyQVpzdhY7QBCuj+hqKlPvUUAWGMG40S/lTNmaFmqWqxxApqDlTYwu8xFkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=liJcH6ge;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C440606A33F
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 18:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C440606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=liJcH6ge
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3170605eec.0
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 10:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795026956; x=1795631756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mP54NqX1yA2UP7uMr6LAS3zfC46Nx8rGJsFCoNbtzuw=;
        b=liJcH6geJRCz4FOvSTntlX2S4ZB6Xo2583QvnUBVL0ogG9jaHEZ3q/ttikR1rapzui
         BR8LLDpI69SLvaZ0ZglHckfsYFLgpGiGH3oE0HLYAtkbohGhOERY8KQ0raH8HsQ2Icli
         DzJxWfcndXz3Kgit8Lf+7GkcvHh24lNvRNnjqA823Krmnm/WyTcLOiZGKAuwp0pVonjY
         CezNuA8k9kS3uEIW+2hbfmm/XiwH7Wf/9AzptSUXxxgT4PkV8dRCTMNO8CasqP7xdGwl
         6BxZV3+1VJZvCOF/Xxl8OsJTiYI9SQbpkMzTHc5DqXe/cM2+ZKwXsWgMhZX2TPg87waI
         I8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026956; x=1795631756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mP54NqX1yA2UP7uMr6LAS3zfC46Nx8rGJsFCoNbtzuw=;
        b=BhXI60mAI7BhcNhcmUojQWl3gSZ4VEaccy69YbnrKIWZXQZnYAJZ4dvHmijSfJhlsx
         0UkKVI1VnPgUmWXNXuxDZhGq18hGNvxBQNcaAinjBAq5IC2osIyI8wreHr1JFOQuzPrw
         9EUWgCqWkXUdJxC3RqaK0MRiluVGnDdyJAKCAjAKtRuaHIwBwISIXud1476FymSwfaVD
         ETEx3GjSKK2vaYtj7LO3o0QBkUp4+bK0ZA1FeqNof8GinLYaCOmv1Rz14lle9AXkrswe
         vJCZbLJbDt9yTi1ETofI66ln+CnlPRGqEkOEb5Jnpq2LNw3bBc8B17mFhMAV+szpEr30
         8eYg==
X-Forwarded-Encrypted: i=1; AL+hErG2nhRdj/rhp+iC/rchOGoD+FCaMX/IYE4GWhsXPIGVrqgDC8s0IrFn01U8WWhRylpzNFMYhqHtNZRqp3EyEQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/q+GC1BilHwNIGENnMBjGcIzUPGInzV7KaeIx9B6RRVQBNFZFA
	T9wRZHadjQYLtQfeSeFXqYSIL/B9zgQQ5eTeJDlA5z/GmmtVDxN/jsWs
X-Gm-Gg: AZFdTZeOEngurILGIu4J5Kn57863v9FqkkZwaAqdMXEFFCrfPZAsjSHeqDRNQIsEaJu
	Kp9JSMtVq4pSrr8nMG78aQj1eubqxK1I7heO2mj9ZVK+v0xuropG1WvvQ9CA3tIB7dNXgNflq+M
	p/I+5lTWjmVANMjiPMcHmDErT7COMliA8nH/YgxutIbHhUEPoAjYinR1gMv7st8X+zFE9pUZcyY
	+i2QxJa3frfFgTlH+zjtvACF0a4ek4/s2p+O82ggzGZGDY4b2XXpgHrJkeRY5yoK6ymbZMCpzfS
	pSSuDLjenzLkxtDBNuscXwU0L25wxLrLh5VIDOtDaRjnw9jOOSUxPXjgr6LiXs14pEaK0+Hqjq+
	L2PWb8hmPEFU+U4CsnRDUk4uLlmcMIo/TdBf2Xnoxr+xU4hX4I627ROD69KI4fNfM0ewTCsoui/
	fwzRZ/uHskUrsTHYHF2HbpKBWuTMqxBdMetuWi6qJq0wepZkX+WZM0kk4JDRoJk7w/HityoznyC
	VEKzr73gr34VoLQBkTZrmuM4ixziRJq/+acswyWZzJcAsafMq/TH6O497acgGc6p1Cv0NM0Lapp
	VAXyKiPikEMHvEQu4UCt1tgD56b2ZY+mou9Cm2EgCcfF+k/bCw==
X-Received: by 2002:a05:693c:409a:b0:382:48a5:cd53 with SMTP id 5a478bee46e88-38281217ff4mr3614000eec.31.1795026955041;
        Wed, 18 Nov 2026 10:35:55 -0800 (PST)
Received: from G7XWH7K1F3 ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45274aesm10450189eec.2.2026.11.18.10.35.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 10:35:54 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Jeff Chen <jeff.chen_1@nxp.com>
Cc: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Jiangshan Yi <yijiangshan@kylinos.cn>,
	Linmao Li <lilinmao@kylinos.cn>,
	Kees Cook <kees+treewide@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH wireless v2 3/4] wifi: nxpwifi: own beacon data used by channel switch work
Date: Thu, 19 Nov 2026 02:35:05 +0800
Message-ID: <20261118183506.45749-4-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118183506.45749-1-enderaoelyther@gmail.com>
References: <20261118183506.45749-1-enderaoelyther@gmail.com>
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

The channel-switch work reads the new beacon data after the cfg80211
callback has returned, but the driver keeps only pointers into the
request, which can be freed by then. The IE parser then reads freed
memory.

Copy the beacon buffers used by nxpwifi_set_mgmt_ies() into an owned
cfg80211_ap_update. Free it when the work finishes or is canceled, and
return -EBUSY while a switch is pending.

Found by code review. Compile-tested with W=1.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
No new W=1, sparse or smatch warnings.

AI assistance was used.

 drivers/net/wireless/nxp/nxpwifi/11h.c      | 14 +++--
 drivers/net/wireless/nxp/nxpwifi/cfg80211.c | 60 ++++++++++++++++++++-
 drivers/net/wireless/nxp/nxpwifi/main.h     |  2 +-
 3 files changed, 68 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/11h.c b/drivers/net/wireless/nxp/nxpwifi/11h.c
index 058c319ff910..a6c87dfad9ee 100644
--- a/drivers/net/wireless/nxp/nxpwifi/11h.c
+++ b/drivers/net/wireless/nxp/nxpwifi/11h.c
@@ -301,21 +301,21 @@ void nxpwifi_dfs_chan_sw_work(struct wiphy *wiphy, struct wiphy_work *work)
 	if (!bss_cfg->beacon_period) {
 		nxpwifi_dbg(adapter, ERROR,
 			    "channel switch: AP already stopped\n");
-		return;
+		goto out;
 	}
 
 	if (nxpwifi_send_cmd(priv, HOST_CMD_UAP_BSS_STOP,
 			     HOST_ACT_GEN_SET, 0, NULL, true)) {
 		nxpwifi_dbg(adapter, ERROR,
 			    "channel switch: Failed to stop the BSS\n");
-		return;
+		goto out;
 	}
 
 	if (nxpwifi_cfg80211_change_beacon(adapter->wiphy, priv->netdev,
-					   &priv->ap_update_info)) {
+					   priv->ap_update_info)) {
 		nxpwifi_dbg(adapter, ERROR,
 			    "channel switch: Failed to set beacon\n");
-		return;
+		goto out;
 	}
 
 	nxpwifi_uap_set_channel(priv, bss_cfg, priv->dfs_chandef);
@@ -323,7 +323,7 @@ void nxpwifi_dfs_chan_sw_work(struct wiphy *wiphy, struct wiphy_work *work)
 	if (nxpwifi_config_start_uap(priv, bss_cfg)) {
 		nxpwifi_dbg(adapter, ERROR,
 			    "Failed to start AP after channel switch\n");
-		return;
+		goto out;
 	}
 
 	nxpwifi_dbg(adapter, MSG,
@@ -336,4 +336,8 @@ void nxpwifi_dfs_chan_sw_work(struct wiphy *wiphy, struct wiphy_work *work)
 		nxpwifi_wake_up_net_dev_queue(priv->netdev, adapter);
 		priv->uap_stop_tx = false;
 	}
+
+out:
+	kfree(priv->ap_update_info);
+	priv->ap_update_info = NULL;
 }
diff --git a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
index a9cee7e602f0..e42f0f9b61dd 100644
--- a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
+++ b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
@@ -1641,6 +1641,8 @@ static int nxpwifi_cfg80211_stop_ap(struct wiphy *wiphy, struct net_device *dev,
 
 	wiphy_delayed_work_cancel(wiphy, &priv->dfs_chan_sw_work);
 	priv->uap_stop_tx = false;
+	kfree(priv->ap_update_info);
+	priv->ap_update_info = NULL;
 	nxpwifi_abort_cac(priv);
 
 	if (nxpwifi_del_mgmt_ies(priv))
@@ -3068,6 +3070,52 @@ static int nxpwifi_cfg80211_set_coalesce(struct wiphy *wiphy,
 	return nxpwifi_coalesce_cfg(priv, &coalesce_cfg);
 }
 
+/* Keep only the beacon buffers consumed by nxpwifi_set_mgmt_ies(). */
+static struct cfg80211_ap_update *
+nxpwifi_dup_csa_update(const struct cfg80211_beacon_data *beacon)
+{
+	struct cfg80211_ap_update *update;
+	struct cfg80211_beacon_data *copy;
+	size_t len;
+	u8 *pos;
+
+	/* Each length comes from a bounded netlink attribute. */
+	len = beacon->tail_len + beacon->beacon_ies_len +
+	      beacon->proberesp_ies_len + beacon->assocresp_ies_len;
+
+	update = kzalloc(sizeof(*update) + len, GFP_KERNEL);
+	if (!update)
+		return NULL;
+
+	copy = &update->beacon;
+	pos = (u8 *)(update + 1);
+	if (beacon->tail_len) {
+		copy->tail = pos;
+		copy->tail_len = beacon->tail_len;
+		memcpy(pos, beacon->tail, beacon->tail_len);
+		pos += beacon->tail_len;
+	}
+	if (beacon->beacon_ies_len) {
+		copy->beacon_ies = pos;
+		copy->beacon_ies_len = beacon->beacon_ies_len;
+		memcpy(pos, beacon->beacon_ies, beacon->beacon_ies_len);
+		pos += beacon->beacon_ies_len;
+	}
+	if (beacon->proberesp_ies_len) {
+		copy->proberesp_ies = pos;
+		copy->proberesp_ies_len = beacon->proberesp_ies_len;
+		memcpy(pos, beacon->proberesp_ies, beacon->proberesp_ies_len);
+		pos += beacon->proberesp_ies_len;
+	}
+	if (beacon->assocresp_ies_len) {
+		copy->assocresp_ies = pos;
+		copy->assocresp_ies_len = beacon->assocresp_ies_len;
+		memcpy(pos, beacon->assocresp_ies, beacon->assocresp_ies_len);
+	}
+
+	return update;
+}
+
 static int
 nxpwifi_cfg80211_uap_add_station(struct nxpwifi_private *priv, const u8 *mac,
 				 struct station_parameters *params)
@@ -3101,9 +3149,13 @@ nxpwifi_cfg80211_channel_switch(struct wiphy *wiphy, struct net_device *dev,
 				struct cfg80211_csa_settings *params)
 {
 	struct nxpwifi_private *priv = nxpwifi_netdev_get_priv(dev);
+	struct cfg80211_ap_update *update;
 	int chsw_msec;
 	int ret;
 
+	if (priv->ap_update_info)
+		return -EBUSY;
+
 	if (priv->adapter->scan_processing) {
 		nxpwifi_dbg(priv->adapter, ERROR,
 			    "radar detection: scan in process...\n");
@@ -3117,6 +3169,10 @@ nxpwifi_cfg80211_channel_switch(struct wiphy *wiphy, struct net_device *dev,
 				       &priv->dfs_chandef))
 		return -EINVAL;
 
+	update = nxpwifi_dup_csa_update(&params->beacon_after);
+	if (!update)
+		return -ENOMEM;
+
 	ret = nxpwifi_del_mgmt_ies(priv);
 	if (ret)
 		nxpwifi_dbg(priv->adapter, ERROR,
@@ -3126,12 +3182,12 @@ nxpwifi_cfg80211_channel_switch(struct wiphy *wiphy, struct net_device *dev,
 	if (ret) {
 		nxpwifi_dbg(priv->adapter, ERROR,
 			    "%s: setting mgmt ies failed\n", __func__);
+		kfree(update);
 		goto done;
 	}
 
 	memcpy(&priv->dfs_chandef, &params->chandef, sizeof(priv->dfs_chandef));
-	memcpy(&priv->ap_update_info.beacon, &params->beacon_after,
-	       sizeof(priv->ap_update_info.beacon));
+	priv->ap_update_info = update;
 
 	if (params->block_tx) {
 		netif_carrier_off(priv->netdev);
diff --git a/drivers/net/wireless/nxp/nxpwifi/main.h b/drivers/net/wireless/nxp/nxpwifi/main.h
index b25a6a4f2936..4d5718ed5031 100644
--- a/drivers/net/wireless/nxp/nxpwifi/main.h
+++ b/drivers/net/wireless/nxp/nxpwifi/main.h
@@ -619,7 +619,7 @@ struct nxpwifi_private {
 	struct wiphy_delayed_work dfs_cac_work;
 	struct wiphy_delayed_work dfs_chan_sw_work;
 	bool uap_stop_tx;
-	struct cfg80211_ap_update ap_update_info;
+	struct cfg80211_ap_update *ap_update_info;
 	struct nxpwifi_11h_intf_state state_11h;
 	struct nxpwifi_ds_mem_rw mem_rw;
 	struct sk_buff_head bypass_txq;
-- 
2.56.1

