Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794758013;
	b=pfPy9QHZSTentFnw3g0saxkURFEFndgySGCA8AxZNPLFKAl3g+1qeeM0cvGxKvRxRaAk
	 TogNan2007gk9UdVgMqE0+HK5eTI60sw4AG0WF+W1RfH/4Od+C/841O+vAsbAmHg35yPr
	 +Hh2ambFYcYptvb5s3/FmYZi8R68trIkjawqd831w/KEmfeHy/4qr4kae9CoiF5gzynUS
	 U8L725aiq1jRJBBzp0LRrM5tuN5xhmaWI5NikXiO6ipYVksPQ75mct15Yg20QVZnb3syK
	 1D+j5qMGzIA9+jMnWeUuz86egIO1VrXsq/N7E5JLE2Dm6f0R2x3PrK5zNFmeBMbG55A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794758013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xR48nVZb9wNMKLkwVq1V3KtGruzhSgnZYDwxmSqRQhk=;
	b=HXnH+dNmG6ByA2AcTR50wgF2N1GZTiI47VA6p4J1ANE23zrnVlzezWy8lbYKe0HjQNqP
	 57vk8cCEiSeTJmH4yUNQ22xW709hAjogAFm5ll0wSqxg4MENAV1oG2Qwh298+OlcRipSA
	 skjO7S/COLa7Py+wiaq8B7TiSXBKgmGsDxXUX2+dsJPuaCrUiIkohNFaEsLCpn/mVQnlf
	 NRBb9Jwha+E9957ZGUKNJ974kQLUUTlkegv/S3aCvX3rBJIjxeJOFH3KRpu3sXn7uTsGg
	 HdGP0DR523zPTtulRNh2LOj7MQDrEMq6yzoT2us27kTB3o7orQhI6GFR5ik7UVPVMKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFirnu9R;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A861606A31A
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 15:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A861606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFirnu9R
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so2908973c88.0
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 07:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794758012; x=1795362812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xR48nVZb9wNMKLkwVq1V3KtGruzhSgnZYDwxmSqRQhk=;
        b=CFirnu9RBS/Rc3igplflQOqKZ0rD/TD7Vqi+mgZRU4A1CGTWgROjj3IYMTWygbpI1N
         cU7CNypAju+pyazGrC4/WU7Cx7fpYBArrxLfrhAyUI7bFjIykYauzUYr/tISqNiUAZ9l
         93b3xi3O6Ky7aWgRK+tHo08wFmdnU8cogVaN7wEL/xbSBGLWGFUGCmo6HwIWlU9xztJ2
         BuJF8Nb2uXFzZ9ccdnyEvjztXf4UEPFyyxrlasfudTGy+ZsNpubzcE+75JLUnWcw8dAr
         ai7/pK9w2dFcjsI5RwmONZvEVV2k4R7AS9C0/PGiUmO6QqHGlAKmg1WhRPjXCwBnYJT8
         EVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794758012; x=1795362812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xR48nVZb9wNMKLkwVq1V3KtGruzhSgnZYDwxmSqRQhk=;
        b=DHiCBvOc8fPYcXVvo80xOaaP0lYWT129RXOz+D0aZ4L4BKTzXQ7ZlqPNR6T9qMQFCf
         CGG2mmZ4FMHgDAaXqwcjnYS62sA+l6SeoA4Bw7b2dJTP5d1rCIvykK4Z/hxcgRaNlavm
         NPwTjKtWWOq/MdmpS3Ke6XIpCmyps8UkmU+FCUX/ZGdf/15HeCmfTit1BsB7j37OPlHU
         KNkTGUHEwyXH5JZT70tM5w2I9aDMBTJKoKkgrmrjSoNoevvdVy5phJo1JkHCgyQT3tt5
         glmd7uZKM858ZGBnB4xOsRZDJK7mqRZdiPJ+cqB9AbZ9B4EwY/nmcs5fiLEyGmaoDOcy
         7ywg==
X-Forwarded-Encrypted: i=1; AL+hErEHf3tiUzDVzrBquJ/xydxnXh16NJJyjzPAuaVzTchdj1+N4Hw6Mqv3jqn0CyOXZEGDGx4JRd0LuJnI8dFRwg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8NhIykhdPVFU4YgdKdVOzNMPFcTnE8I9F/0c8EvypwPr5+o6ZN
	zPlpUb92vWMFeJ7Ln85OyzPHX1l0AXFnG/QMEV5w9Ld1Qq1IWa2zkrAjDJBt7I6/DJ8=
X-Gm-Gg: AYBFou2F5kjil+PgGRAgqzrZZIPiqg0kFc3PYJ4icDaMn6Y+vtLMfZBzFwn5wnX+Fdz
	chRP+/gkhssGbuQX9PGn6XQQ3GsPujjVLrAlsuP3c4aZMsIEa/3V27j3Ywx0ehTzUYII2XPbllc
	UNk7D50PNvyc/dMCV8o1/vBaSmhZj1nsj5AJgf63oHV5Z9JBDo9NNyEeFjcy4dRtBKLISzppjIV
	pTfjjW3vN8DwaNH3ORmKwjceRdN+NFCP0CztVbYbA5LSr87xdKwWI9CALCidnLHuGapBHilVEOi
	BH7g+KLiBlgPAt734XMCqrhc1ThjF4KR9z9OHdkGrj8CVJszR2MKNL/qEGyBU19a3ex8qd3WVbH
	Nm9PQwgdWvV4c/H1L1/qrG0+TOesaj/igUZXgFxOW0VgYJAeCd1jeBrCIlcYw2MGiMOOT+mWmCc
	rlN96UgJuU2cZpGNsdkjBnxZVUFxyu/fTYxCq1gSV6+/zqdiQRAoi5iFiNuFaxap4OjarKumfUQ
	3SI45rtm97X65KwxVPERNg9BIGxDAejmvT+pumsu7gLDQx9wtEsNCKbHYZUOgTGgQZyY5uh81nz
	c8m6AXI9B7i1FARuaYU4BWExErsHmxuKkyTwp09wSFJ43/oCSHdRknLg+jq9
X-Received: by 2002:a05:7023:a89:b0:19c:c396:37aa with SMTP id a92af1059eb24-1b50311a206mr9376889c88.22.1794758012067;
        Sun, 15 Nov 2026 07:53:32 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:d1be:2710:af83:9beb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b27dsm23892384c88.2.2026.11.15.07.53.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 07:53:31 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: "John W. Linville" <linville@tuxdriver.com>,
	Javier Lopez <jlopex@gmail.com>,
	Jukka Rissanen <jukka.rissanen@linux.intel.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless v3] wifi: mac80211_hwsim: drain address lookup users before radio removal
Date: Sun, 15 Nov 2026 23:53:10 +0800
Message-ID: <20261115155310.89478-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Closing the socket that owns a destroy-on-close radio can free the
radio while a frame, TX status, or PMSR command still uses the pointer
returned by get_hwsim_data_ref_from_addr(). A forced QEMU/KASAN run
reproduced the resulting use-after-free in
hwsim_cloned_frame_received_nl().

rhashtable_lookup_fast() protects only the lookup itself. The hwsim
deletion paths already unpublish a radio from the hash table under
hwsim_radio_lock before performing the sleeping teardown.

Take a per-radio reference under hwsim_radio_lock when an address lookup
succeeds. After unpublishing a radio, drop its publication reference and
wait for lookup users before unregistering the hardware. This avoids
serializing unrelated radios with asynchronous teardown while preventing
teardown from freeing an active lookup result.

AI assistance was used.

Fixes: e9ed49bf4c2c ("mac80211-hwsim: Add support for HWSIM_ATTR_DESTROY_RADIO_ON_CLOSE")
Link: https://patch.msgid.link/20261028141751.6728-3-enderaoelyther@gmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Changes in v3:
- Resend with git send-email. v2 went out through a Gmail connector that
  line-wrapped the diff, so it does not apply. No code changes.

v2: https://lore.kernel.org/linux-wireless/CACHPgzxg0i5S5hKyuSLjNYhLKr7ZoxKO=VefOtsiU6zgod=yfg@mail.gmail.com/

Changes in v2:
- Replace the family-wide command/removal mutex with per-radio lookup
  references.
- Unpublish before dropping the publication reference, then drain lookup
  users before hardware teardown.
- Cover all four lookup sites and make this a standalone patch on
  wireless/main, where patch 1/2 is already merged.

Testing:
- GCC 12.2 W=1 module/built-in builds; sparse, Smatch and Coccinelle.
- QEMU/KASAN/lockdep forced removal at all four lookup sites. Every base
  contrast reproduced the use-after-free; the fixed revision stayed clean
  and passed per-radio isolation, real-cookie TX status and teardown churn.
- Not covered: PMSR normal completion, virtio dispatch and module exit.

 .../net/wireless/virtual/mac80211_hwsim_i.h   |  4 ++
 .../wireless/virtual/mac80211_hwsim_main.c    | 47 +++++++++++++++----
 2 files changed, 43 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/virtual/mac80211_hwsim_i.h b/drivers/net/wireless/virtual/mac80211_hwsim_i.h
index 0f0f2ac6d80e..c91bbd99b5a2 100644
--- a/drivers/net/wireless/virtual/mac80211_hwsim_i.h
+++ b/drivers/net/wireless/virtual/mac80211_hwsim_i.h
@@ -10,6 +10,8 @@
 #ifndef __MAC80211_HWSIM_I_H
 #define __MAC80211_HWSIM_I_H
 
+#include <linux/completion.h>
+#include <linux/refcount.h>
 #include <net/mac80211.h>
 #include "mac80211_hwsim.h"
 #include "mac80211_hwsim_nan.h"
@@ -51,6 +53,8 @@ struct mac80211_hwsim_link_data {
 struct mac80211_hwsim_data {
 	struct list_head list;
 	struct rhash_head rht;
+	refcount_t users;
+	struct completion users_done;
 	struct ieee80211_hw *hw;
 	struct device *dev;
 	struct ieee80211_supported_band bands[NUM_NL80211_BANDS];
diff --git a/drivers/net/wireless/virtual/mac80211_hwsim_main.c b/drivers/net/wireless/virtual/mac80211_hwsim_main.c
index 49ec2948c68a..4703b6fc328d 100644
--- a/drivers/net/wireless/virtual/mac80211_hwsim_main.c
+++ b/drivers/net/wireless/virtual/mac80211_hwsim_main.c
@@ -711,7 +711,21 @@ struct hwsim_radiotap_ack_hdr {
 
 static struct mac80211_hwsim_data *get_hwsim_data_ref_from_addr(const u8 *addr)
 {
-	return rhashtable_lookup_fast(&hwsim_radios_rht, addr, hwsim_rht_params);
+	struct mac80211_hwsim_data *data;
+
+	spin_lock_bh(&hwsim_radio_lock);
+	data = rhashtable_lookup_fast(&hwsim_radios_rht, addr, hwsim_rht_params);
+	if (data && WARN_ON_ONCE(!refcount_inc_not_zero(&data->users)))
+		data = NULL;
+	spin_unlock_bh(&hwsim_radio_lock);
+
+	return data;
+}
+
+static void put_hwsim_data(struct mac80211_hwsim_data *data)
+{
+	if (data && refcount_dec_and_test(&data->users))
+		complete(&data->users_done);
 }
 
 /* MAC80211_HWSIM netlink family */
@@ -4236,11 +4250,15 @@ static int hwsim_pmsr_report_nl(struct sk_buff *msg, struct genl_info *info)
 
 	if (!hwsim_virtio_enabled) {
 		if (hwsim_net_get_netgroup(genl_info_net(info)) !=
-		    data->netgroup)
-			return -EINVAL;
+		    data->netgroup) {
+			err = -EINVAL;
+			goto out_put;
+		}
 
-		if (info->snd_portid != data->wmediumd)
-			return -EPERM;
+		if (info->snd_portid != data->wmediumd) {
+			err = -EPERM;
+			goto out_put;
+		}
 	}
 
 	mutex_lock(&data->mutex);
@@ -4280,6 +4298,8 @@ static int hwsim_pmsr_report_nl(struct sk_buff *msg, struct genl_info *info)
 	data->pmsr_request_wdev = NULL;
 
 	mutex_unlock(&data->mutex);
+out_put:
+	put_hwsim_data(data);
 	return err;
 }
 
@@ -6140,6 +6160,8 @@ static int mac80211_hwsim_new_radio(struct genl_info *info,
 	/* By default all radios belong to the first group */
 	data->group = 1;
 	mutex_init(&data->mutex);
+	refcount_set(&data->users, 1);
+	init_completion(&data->users_done);
 
 	data->netgroup = hwsim_net_get_netgroup(net);
 	data->wmediumd = hwsim_net_get_wmediumd(net);
@@ -6297,6 +6319,10 @@ static void mac80211_hwsim_del_radio(struct mac80211_hwsim_data *data,
 				     const char *hwname,
 				     struct genl_info *info)
 {
+	/* The radio is no longer published. Drain address lookup users. */
+	if (!refcount_dec_and_test(&data->users))
+		wait_for_completion(&data->users_done);
+
 	hwsim_mcast_del_radio(data->idx, hwname, wiphy_net(data->hw->wiphy), info);
 	debugfs_remove_recursive(data->debugfs);
 	ieee80211_unregister_hw(data->hw);
@@ -6432,7 +6458,7 @@ static int hwsim_tx_info_frame_received_nl(struct sk_buff *skb_2,
 {
 
 	struct ieee80211_hdr *hdr;
-	struct mac80211_hwsim_data *data2;
+	struct mac80211_hwsim_data *data2 = NULL;
 	struct ieee80211_tx_info *txi;
 	struct hwsim_tx_rate *tx_attempts;
 	u64 ret_skb_cookie;
@@ -6530,8 +6556,10 @@ static int hwsim_tx_info_frame_received_nl(struct sk_buff *skb_2,
 		txi->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
 
 	ieee80211_tx_status_irqsafe(data2->hw, skb);
+	put_hwsim_data(data2);
 	return 0;
 out:
+	put_hwsim_data(data2);
 	return -EINVAL;
 
 }
@@ -6539,7 +6567,7 @@ static int hwsim_tx_info_frame_received_nl(struct sk_buff *skb_2,
 static int hwsim_cloned_frame_received_nl(struct sk_buff *skb_2,
 					  struct genl_info *info)
 {
-	struct mac80211_hwsim_data *data2;
+	struct mac80211_hwsim_data *data2 = NULL, *txdata = NULL;
 	struct ieee80211_rx_status rx_status;
 	struct ieee80211_hdr *hdr;
 	const u8 *dst;
@@ -6602,7 +6630,6 @@ static int hwsim_cloned_frame_received_nl(struct sk_buff *skb_2,
 	    info->attrs[HWSIM_ATTR_ADDR_TRANSMITTER]) {
 		u64 cookie = nla_get_u64(info->attrs[HWSIM_ATTR_COOKIE]);
 		struct sk_buff *orig_skb, *found = NULL;
-		struct mac80211_hwsim_data *txdata;
 		struct ieee80211_tx_info *txi;
 		const u8 *transmitter;
 		unsigned long flags;
@@ -6695,11 +6722,15 @@ static int hwsim_cloned_frame_received_nl(struct sk_buff *skb_2,
 
 	mac80211_hwsim_rx(data2, &rx_status, skb);
 	mutex_unlock(&data2->mutex);
+	put_hwsim_data(txdata);
+	put_hwsim_data(data2);
 
 	return 0;
 out_unlock:
 	mutex_unlock(&data2->mutex);
 out:
+	put_hwsim_data(txdata);
+	put_hwsim_data(data2);
 	dev_kfree_skb(skb);
 	return -EINVAL;
 }

base-commit: 831e33ad02ff884ecc793c07a9c9bd9e06941fe5
-- 
2.56.1

