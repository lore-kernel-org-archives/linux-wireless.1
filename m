Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.217.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794540549;
	b=LZowkSlfnIuGX7TqY8P+la2rdwslcNPE2kN0dPBy/w1BKNss9FBtRsX+CH/DwK/1yG8X
	 13EMRlzLsGYeaHuKrFaEiGHfK/YS4D+NKGijcQ7eLcUfiGy3do8cry4Kh0uulusoJHHOm
	 y9Hjn9aLLmw9IqiHnaaD5+eeHkKMQERodramBVulHgY9R9mybb4KNh/f90TCLVrp7jFfq
	 OVv/2F8Xul6r3vTax0ynnb7MCnTeG4ep3SXsyu+LobkkqSP11F9FgNIajIbZ57XipVwLf
	 aJXxjfATaoGurBN0az7heLlujlmyX2OVf2vi/2CNRwFjiLsrcS9N8S7AsLDyq5szoGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=K+k+BU3ruP30FcRofnzEWnAZqMIuJBVkJtyRQrr4ns4=;
	b=wGAxe3IUhVaEhmOVA/qXz4bjlgB6HmavP0RsjtJvccM/Nmslax0C2dggD5FC/9izhK+1
	 CdhzOaK+qAWzPtobglqhZq/sHTuYNADZejnt5lznGS7QjyPlsKXt09ylkFoUHDhqCLafz
	 fdei9Uwi5RaCJMFTbTY4PYt7Dn2X0YJZpEVGcwClV+ac/UpyAlcHK3j5r5f4z0gffX/Nr
	 476asAeVkSZlr+1to4LBwzL3EmUBcSEfnsOydWP2MT7Cyb9wZpb4oVkTSL4zqfLJBsR0B
	 YUy4VEVqjcVCoQtHM3j2BVk4gZFt9dAFIu21a/F1I2fCwcTjrtwtsMgXAmPDD4H4BbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oJoBDn3L;
	arc=fail smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08648606A332
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 03:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08648606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oJoBDn3L
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7d2dc1ac787so117635137.2
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 19:29:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794540548; cv=none;
        d=google.com; s=arc-20260327;
        b=cD9UcFtqSqh1r8Nm4Xs1BD2RwFRVWKWmDOe4jDiaAz9j+Ii0Zyuh2AeSTi45vVLXDZ
         JQC7izteFz8DfDqX3/ip9fFnPM5BuwaqTYYHKrSplH4vMKBorj6hcB0K++hucMv60N3I
         4rySgx/2vsvP6kUJ6pUvB7CGECWAPHv9d/boDOp3tv+Tw5A84YlAXv2giJieh19uzRRO
         +2pCxc+67I4z+BSr9Jd0/EEk0JAfylhMKKM7YjMbIszKu/FhbwKb93y0+L7QwNoupwJA
         G3F/rHqOCHcWVI/z0bq6inQV1rX8QkOJmRCHvnQcA0TBXjpKMlMjn07u6IoXiKQ6atP9
         NrOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=K+k+BU3ruP30FcRofnzEWnAZqMIuJBVkJtyRQrr4ns4=;
        fh=r0Kwdbv2R5kvG2v1Ufx4Q7Tq9NHVE09/2ovzqfUp0go=;
        b=CLyPYsaQkCHl67npshK6giTmhHwkkdxEDKBxMHUepSaxZwvdXAtbSmsD+XAhWHnuDV
         D6jOZ7dpezDrg7ckUcRvhxOY7vPzBMD+AVkwXgUaTwawrAcgB8Q2iIHqy4bqegScIZfH
         QPNBaJBdS5D0VOz8JxD8ImHxJf7404tMJ6ClUU6luAfj8ABo0JjuUze7V/Lh+I+nAJLv
         QXyrxNVQngekqu/F2ihVsxCdG8lYvv4umgabgmLimSvRl9Ios9rHv39D2s1pCWz6BGo4
         yD0D9AR4ZU2XbKDM75Zr80mNe6ZNNmZQqjlxuuZMpMSBqh6iH8U/rbhYOLWlUDOjf6ua
         sHJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794540548; x=1795145348; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K+k+BU3ruP30FcRofnzEWnAZqMIuJBVkJtyRQrr4ns4=;
        b=oJoBDn3L5F6KOzorHhzjoNdwUkNLSd8/8QKNYq6MkFSXdDdO1LeB7U7Xbt+d24Q6mI
         JjY+2Bmu9tWVNZxpwr1qXsHk6m0et9vM737LXAYWdRDNi+32ErE78Mn4MJ3E1fLTXIC6
         TWFZNBAqkvSIS1xC530vP61bS38Gpdjj7p7Ao3C6QNM1kkhiHczBrLf/PQDLSkKl1DpV
         bCtn3STOWQe85XcbOYiulIF4/OJED/TACbhNS4MBCj880GlPWw99Cl6AAjud9HlPMyU+
         7xlzOCgx68Qqpr/yIPwc770d79xLQNGdMLzMMu3Ch3wLfvwSzQV0ySdH9WWEp/4udNkW
         RevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540548; x=1795145348;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K+k+BU3ruP30FcRofnzEWnAZqMIuJBVkJtyRQrr4ns4=;
        b=BQ+Yny+2zzblNU7meBR3wFyIJRvXJILnvFMxgmZfBNnIfIen5Ntgrea5htU2zaSJKT
         1cba90ZClXsZD0FmRjx8nEqW+utX8j8p+Iwm1fXIhyNnAs3gByLduZ/E44OlOQRvCyLd
         tvZxKtbV7XypZzdmx1SlT90tAsXLYTkx6dOdCfGB63HjuZc2qXT+gdPm6NPxh4u2K0SG
         iQnZTS1DfJ7Wqp4Ro4kwAcqWLK0UQIU395z8eHr2ealu2KyoPNoAjesg0W1JEQKy5257
         /qMCYo8Lp5jdbpfPIHIMUqbJYgxpOV1RNkylvL+LiF6zn+hgVW6OSt9pVPkkWh5JnguQ
         p1rg==
X-Forwarded-Encrypted: i=1; AL+hErFnXlo2JEeMllZrdjVwDqwOL5iY3cZD4SctfHwUlA0R5rMI3Wvi+IqpquttegaN6qtkukJKC3vE0ozplMMLrg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9xbtzbwWbMzBUfPXVkRG3mXlw4M2CBttrMCNFLp2RzvKDgXVzn
	poMSk/jtIUjXqHJj7zvaUd3kj5K8+sFBjkqvfivqdJV6U/BHrkO3zvzK0i7MVWH7BdC4uWeOUDU
	BPiZOP5ZLIh0Hn0VL0l+mVsCpF+yiMfI=
X-Gm-Gg: AYBFou1RnXncYhktI8qrqxStoxzBgm1z0+44q3iyUdhTTXo3BhwGXdlAm+iGXamIRTk
	fGXuJovsLDHYbqZJ5ELv3LjlyGxB9LwXZ0bn+AY4zjgdvgJk5RkijrmMI7BwZJpUB95TwT/dqR5
	qN65DmVG+HeF9RMwa0MU+qtqxfD9HQL5oz0d4aLX3KCHyO4zF74Xi9Rk//Hac5AK7syJ7m1Xkfx
	KBHgjBe99snniG4TsJ5W0bAP6Bj7X6W+kfUW8smirbUjwlOkDGVuJlkJXbU282dIryiZtTXZOXp
	+RGy9UD2OKP+AeFXbsiyVx6AKBKhWex2ztrhU/a0fvfcf6Exd8qTM/tVu0if6bZQ8pNgcbVttUH
	r8sYwyBIWGnMgpcAz+o/eVRYNht0QCC5rk2N7
X-Received: by 2002:a05:6102:511f:b0:7ae:c2ca:8e1 with SMTP id
 ada2fe7eead31-7d64d6d6b5bmr338156137.11.1794540547414; Thu, 12 Nov 2026
 19:29:07 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 13 Nov 2026 03:29:07 +0000
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: enderaoelyther@gmail.com
Date: Fri, 13 Nov 2026 03:29:07 +0000
X-Gm-Features: AclHuK-SgNml3uPlVF3GKFskL72Pm3F_HH6yudvnk94dfnqPM8d3DvDsq7x5boQ
Message-ID: <CACHPgzxg0i5S5hKyuSLjNYhLKr7ZoxKO=VefOtsiU6zgod=yfg@mail.gmail.com>
Subject: [PATCH v2] wifi: mac80211_hwsim: drain address lookup users before
 radio removal
To: Johannes Berg <johannes@sipsolutions.net>
Cc: "John W. Linville" <linville@tuxdriver.com>, Javier Lopez <jlopex@gmail.com>, 
	Jukka Rissanen <jukka.rissanen@linux.intel.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

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

Fixes: e9ed49bf4c2c ("mac80211-hwsim: Add support for
HWSIM_ATTR_DESTROY_RADIO_ON_CLOSE")
Link: https://patch.msgid.link/20261028141751.6728-3-enderaoelyther@gmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
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

diff --git a/drivers/net/wireless/virtual/mac80211_hwsim_i.h
b/drivers/net/wireless/virtual/mac80211_hwsim_i.h
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
diff --git a/drivers/net/wireless/virtual/mac80211_hwsim_main.c
b/drivers/net/wireless/virtual/mac80211_hwsim_main.c
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
@@ -4236,11 +4250,15 @@ static int hwsim_pmsr_report_nl(struct sk_buff
*msg, struct genl_info *info)

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
@@ -4280,6 +4298,8 @@ static int hwsim_pmsr_report_nl(struct sk_buff
*msg, struct genl_info *info)
 	data->pmsr_request_wdev = NULL;

 	mutex_unlock(&data->mutex);
+out_put:
+	put_hwsim_data(data);
 	return err;
 }

@@ -6140,6 +6160,8 @@ static int mac80211_hwsim_new_radio(struct
genl_info *info,
 	/* By default all radios belong to the first group */
 	data->group = 1;
 	mutex_init(&data->mutex);
+	refcount_set(&data->users, 1);
+	init_completion(&data->users_done);

 	data->netgroup = hwsim_net_get_netgroup(net);
 	data->wmediumd = hwsim_net_get_wmediumd(net);
@@ -6297,6 +6319,10 @@ static void mac80211_hwsim_del_radio(struct
mac80211_hwsim_data *data,
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
@@ -6432,7 +6458,7 @@ static int
hwsim_tx_info_frame_received_nl(struct sk_buff *skb_2,
 {

 	struct ieee80211_hdr *hdr;
-	struct mac80211_hwsim_data *data2;
+	struct mac80211_hwsim_data *data2 = NULL;
 	struct ieee80211_tx_info *txi;
 	struct hwsim_tx_rate *tx_attempts;
 	u64 ret_skb_cookie;
@@ -6530,8 +6556,10 @@ static int
hwsim_tx_info_frame_received_nl(struct sk_buff *skb_2,
 		txi->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;

 	ieee80211_tx_status_irqsafe(data2->hw, skb);
+	put_hwsim_data(data2);
 	return 0;
 out:
+	put_hwsim_data(data2);
 	return -EINVAL;

 }
@@ -6539,7 +6567,7 @@ static int
hwsim_tx_info_frame_received_nl(struct sk_buff *skb_2,
 static int hwsim_cloned_frame_received_nl(struct sk_buff *skb_2,
 					  struct genl_info *info)
 {
-	struct mac80211_hwsim_data *data2;
+	struct mac80211_hwsim_data *data2 = NULL, *txdata = NULL;
 	struct ieee80211_rx_status rx_status;
 	struct ieee80211_hdr *hdr;
 	const u8 *dst;
@@ -6602,7 +6630,6 @@ static int hwsim_cloned_frame_received_nl(struct
sk_buff *skb_2,
 	    info->attrs[HWSIM_ATTR_ADDR_TRANSMITTER]) {
 		u64 cookie = nla_get_u64(info->attrs[HWSIM_ATTR_COOKIE]);
 		struct sk_buff *orig_skb, *found = NULL;
-		struct mac80211_hwsim_data *txdata;
 		struct ieee80211_tx_info *txi;
 		const u8 *transmitter;
 		unsigned long flags;
@@ -6695,11 +6722,15 @@ static int
hwsim_cloned_frame_received_nl(struct sk_buff *skb_2,

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

base-commit: cb1edd20907e13b058c0d5bd34c9d51b5bedc879
-- 
2.56.0
