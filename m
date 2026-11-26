Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690697;
	b=diR6UKzBcl9uM/va+439NJTI5y0X9xhBi+VeKqlwXTpnP2WSlMD7+VnUIUTBgqIkwCEe
	 6QeSiwJv7SpkxzCQ7ELeebrEwgg28z+bWqEEBgiPtsK6CzaEZGpBfR5DWwPvu/9HG7l1k
	 HugGUqc3bAUB8lvXAERe5wI9Cjygu6ompTx52U/ZHMavNVEtF4srPqlusLAxN8WS7lCdA
	 GGDKLoKhILpjCA5TF4rMObJoGSEs6/bKRI6eL8Z48KsY9Ts3mbcnAdxrkf1Twr7xI3b1K
	 U8HtTcK2htSZV0mLwjR6KBXYtTeHNMfQmeY1LGCkth4IbQ9hPsn2KezLkPZ2fjwRBFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690697;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=7snruxzjfiOIh0GbsdCqKqB+B2l/QguYxJFmHgh/lKs=;
	b=dsDz+Q5/3NlMZwkh2DDMUflmQzpqeHR8FqxqHQv3afSlRwc5vK1DpC2iSvFt1G9L9xMS
	 /xrNnXfbqjsjZHlBXstwuiOpWoiFOXIuD9JjEaGs7FZANX8iZ7rfTqSzkWU0A2W8JHW9O
	 0i2UCk7OO61vhudbxrOIuH8ZV8NM1rprNlwkvlPzWYVpLKtxk4WkHRHlI2ox+6NT4fyS5
	 hrQXC5HU3fQtQOmAIuGIx0zdb6PuyZm7JV8VZt0C4G4UJM5pylBTaWqudXTS3AaXtTOUH
	 9GcMJEOhGibqZR5PxD6xWYII8lv59A9JiSSwdXlAgklD+eyJt8NSiGqDrf/toVOAGZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.net;
	spf=pass smtp.mailfrom=gmx.net;
	dkim=pass header.d=gmx.net header.i=georgmueller@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b="f7Mj/zCv";
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16A3606A6AB
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 10:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C16A3606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=georgmueller@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=f7Mj/zCv
DKIM2-Signature:  i=1; m=1; t=1795690695;
 mf=PGdlb3JnbXVlbGxlckBnbXgubmV0Pg==;
 rt=PGxpbnV4LXdpcmVsZXNzQHZnZXIua2VybmVsLm9yZz4=;
 d=gmx.net;
 s=s31663417:rsa-sha256:Z8u5yxUuz9ORsHgf2N7nZE/i1bgC
   pfGv74ZRYHr4v5OyJLM+X4fT1NQnraHgT5e8kpA5fIPUZ7PXE/dtXqZlhzMQ0Red64TLCZQnSLb
   6/y//ooTLDewrUoNVh3b4j2HNI9jSPe8+A0uOOkq54O0M3uQ0DARerHGvLGK0KD9Mk20r4mwdx9
   a1FclrWhh/e3WIthzCDd/O0JqBNjcYlT9ijFn5VPer+nX5sNToqn1dT4McQPz3cljsEywIRF5h1
   KkLW/8xkWm+WYGx9W4gtaMbevt2jeThIsP2Le7dh7CIxx0y20C31DNBUgkBCr1XG+fkWVftY3Wj
   JJqpXuMBrykD6g==;
Message-Instance:  m=1;
 h=sha256:
   obVrJUCJoflxd1D5svOQa4z+k4AxS1v9vwK5ztFtPyA=:
   jrTk1HT/+QEkhEuWidZ/EVJ8NABsLj5TOsCs8vuCSb8=,
  sha512:
   Jpn7IYc8QnwAhsF30eACVWws8oqx61dDo9krmMsBloX/YqEzkt7n1W1vAMVGAYF5bjZ/0y0f86lxtgZHptZcdw==:
   jKccWb0/DxOJPdt+p+nQUIjc9Kh11bS4prjjDn+R6Hw9HPgFkdE2jtEOkcpNOgr1uaUmj81y9rMPHlVW8UH+EA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1795690678; x=1796295478; i=georgmueller@gmx.net;
	bh=7snruxzjfiOIh0GbsdCqKqB+B2l/QguYxJFmHgh/lKs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=f7Mj/zCvy8EFN+dYdBFaj3iKjedN0v0v22Vg79rPpAt5jhIHj/uYl+UnSDo8Z+ur
	 flmbeOGk9O+ajKVF2Acuv99H5q0OwiJ/jnYldf+ke20WntxQZjM5Wbyv9v2Bjbsu6
	 NENCPmkhiLFCDE64/vUGxrBfy7w67Df2YHwSPYOivTDtwWm/D1FZuBcOnj1tM/Uu2
	 4EKPpZYims49Y9y4Gb090emgHb869HssmuFYrJCwB8wPPXoH6fpb5zKSXzz80F/B3
	 +jrKQbrA1tWdLD6atfCvgGvhhCbkzj97QaI3JZlDPb0hX+y6lsGGr+gysdRsNFud+
	 mZPhVleBh8TVi8vvVQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MjjCL-1yDL6U3gjr-00gwsx; Thu, 26
 Nov 2026 11:57:58 +0100
From: =?UTF-8?q?Georg=20M=C3=BCller?= <georgmueller@gmx.net>
To: mehmet.fide@gmail.com,
	Jes.Sorensen@gmail.com
Cc: rtl8821cerfe2@gmail.com,
	pkshih@realtek.com,
	hi@shreyan.sh,
	mehmet.fide@screeningeagle.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Georg=20M=C3=BCller?= <georgmueller@gmx.net>
Subject: [RFC PATCH v4 2/5] wifi: rtl8xxxu: handle rate control per mac_id for 8188e
Date: Thu, 26 Nov 2026 11:57:39 +0100
Message-ID: <20261126105742.1086282-3-georgmueller@gmx.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126054350.2893087-1-mehmet.fide@gmail.com>
References: <20261126054350.2893087-1-mehmet.fide@gmail.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hXsWudnbZpUM0bC47Cttne57C3SxQYH5yjQThkaJWKG7AcfVNkt
 GMqdJ0KW9Q3gIYjl2BDwFVOO1Tgvl7M3Wohi3ZMDrmyc6eedNxv/mE6tmr7vLS5opVcSfG4
 g0B5yZlyyqJSU3X8+Ir43dmHqKtW6RV9U7UqL4gy41Fg9GCXVEE7qKzsX+7wLuWsFTq39wF
 G/T51lBUFrcJMGig48qVQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1lUvggrJft8=;BS1wxyqNDnHdPS7qEz5nUE6QOVs
 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
 g==

Convert member ra_info to an array with one entry per mac id. This
allows having different rate control settings per connected station
in AP mode.

The max_macid_num is conservative. The old driver used 32 [1], some
other sources said 64 [2]. I have not enough adapters to test any of the
higher values. Given the usage of this chipset in nano dongles, I think
the 16 might be high enough.

[1] https://github.com/lwfinger/rtl8188eu/blob/f5d1c8df2e2d8b217ea0113bf2c=
f3e37df8cb716/include/sta_info.h#L28
[2] https://lore.kernel.org/linux-wireless/27e83382-4c84-1841-c428-d1e5143=
ea20c@gmail.com/

Signed-off-by: Georg M=C3=BCller <georgmueller@gmx.net>
=2D--
 drivers/net/wireless/realtek/rtl8xxxu/8188e.c | 18 ++++++++++--------
 drivers/net/wireless/realtek/rtl8xxxu/core.c  | 19 ++++++++++++++++---
 .../net/wireless/realtek/rtl8xxxu/rtl8xxxu.h  |  3 ++-
 3 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtl8xxxu/8188e.c b/drivers/net/w=
ireless/realtek/rtl8xxxu/8188e.c
index d6f50e72d2ce..3c887322f76b 100644
=2D-- a/drivers/net/wireless/realtek/rtl8xxxu/8188e.c
+++ b/drivers/net/wireless/realtek/rtl8xxxu/8188e.c
@@ -1468,9 +1468,8 @@ static void rtl8188e_reset_ra_counter(struct rtl8xxx=
u_ra_info *ra)
 	ra->nsc_down =3D (n_threshold_high[rate_id] + n_threshold_low[rate_id]) =
>> 1;
 }
=20
-static void rtl8188e_rate_decision(struct rtl8xxxu_ra_info *ra)
+static void rtl8188e_rate_decision(struct rtl8xxxu_priv *priv, struct rtl=
8xxxu_ra_info *ra)
 {
-	struct rtl8xxxu_priv *priv =3D container_of(ra, struct rtl8xxxu_priv, ra=
_info);
 	const u8 *retry_penalty_idx_0;
 	const u8 *retry_penalty_idx_1;
 	const u8 *retry_penalty_up_idx;
@@ -1669,7 +1668,7 @@ void rtl8188e_handle_ra_tx_report2(struct rtl8xxxu_p=
riv *priv, struct sk_buff *s
 	u32 *_rx_desc =3D (u32 *)(skb->data - sizeof(struct rtl8xxxu_rxdesc16));
 	struct rtl8xxxu_rxdesc16 *rx_desc =3D (struct rtl8xxxu_rxdesc16 *)_rx_de=
sc;
 	struct device *dev =3D &priv->udev->dev;
-	struct rtl8xxxu_ra_info *ra =3D &priv->ra_info;
+	struct rtl8xxxu_ra_info *ra;
 	u32 tx_rpt_len =3D rx_desc->pktlen & 0x3ff;
 	u32 items =3D tx_rpt_len / TX_RPT2_ITEM_SIZE;
 	u64 macid_valid =3D ((u64)_rx_desc[5] << 32) | _rx_desc[4];
@@ -1680,14 +1679,17 @@ void rtl8188e_handle_ra_tx_report2(struct rtl8xxxu=
_priv *priv, struct sk_buff *s
=20
 	dev_dbg(dev, "%s: len: %d items: %d\n", __func__, tx_rpt_len, items);
=20
-	/* We only use macid 0, so only the first item is relevant.
-	 * AP mode will use more of them if it's ever implemented.
+	/* In station mode we only use macid 0, so only the first item
+	 * is relevant. In AP mode every station has its own macid.
 	 */
 	if (!priv->vifs[0] || priv->vifs[0]->type =3D=3D NL80211_IFTYPE_STATION)
 		items =3D 1;
+	else
+		items =3D min_t(u32, items, RTL8188E_MAX_MAC_ID_NUM);
=20
 	for (macid =3D 0; macid < items; macid++) {
 		valid =3D false;
+		ra =3D &priv->ra_info[macid];
=20
 		if (macid < 64)
 			valid =3D macid_valid & BIT(macid);
@@ -1704,7 +1706,7 @@ void rtl8188e_handle_ra_tx_report2(struct rtl8xxxu_p=
riv *priv, struct sk_buff *s
=20
 			if (ra->total > 0) {
 				if (ra->ra_stage < 5)
-					rtl8188e_rate_decision(ra);
+					rtl8188e_rate_decision(priv, ra);
 				else if (ra->ra_stage =3D=3D 5)
 					rtl8188e_power_training_try_state(ra);
 				else /* ra->ra_stage =3D=3D 6 */
@@ -1781,7 +1783,7 @@ rtl8188e_update_rate_mask(struct rtl8xxxu_priv *priv=
,
 			  u32 ramask, u8 rateid, int sgi, int txbw_40mhz,
 			  u8 macid)
 {
-	struct rtl8xxxu_ra_info *ra =3D &priv->ra_info;
+	struct rtl8xxxu_ra_info *ra =3D &priv->ra_info[macid];
=20
 	ra->rate_id =3D rateid;
 	ra->rate_mask =3D ramask;
@@ -1792,7 +1794,7 @@ rtl8188e_update_rate_mask(struct rtl8xxxu_priv *priv=
,
=20
 static void rtl8188e_ra_set_rssi(struct rtl8xxxu_priv *priv, u8 macid, u8=
 rssi)
 {
-	priv->ra_info.rssi_sta_ra =3D rssi;
+	priv->ra_info[macid].rssi_sta_ra =3D rssi;
 }
=20
 void rtl8188e_ra_info_init_all(struct rtl8xxxu_ra_info *ra)
diff --git a/drivers/net/wireless/realtek/rtl8xxxu/core.c b/drivers/net/wi=
reless/realtek/rtl8xxxu/core.c
index 3d0c22db30a8..e3266ed9c302 100644
=2D-- a/drivers/net/wireless/realtek/rtl8xxxu/core.c
+++ b/drivers/net/wireless/realtek/rtl8xxxu/core.c
@@ -3963,6 +3963,7 @@ static int rtl8xxxu_init_device(struct ieee80211_hw =
*hw)
 	struct device *dev =3D &priv->udev->dev;
 	struct rtl8xxxu_fileops *fops =3D priv->fops;
 	bool macpower;
+	u16 mac_id;
 	int ret;
 	u8 val8;
 	u16 val16;
@@ -4443,8 +4444,10 @@ static int rtl8xxxu_init_device(struct ieee80211_hw=
 *hw)
 		priv->cfo_tracking.crystal_cap =3D priv->default_crystal_cap;
 	}
=20
-	if (priv->rtl_chip =3D=3D RTL8188E)
-		rtl8188e_ra_info_init_all(&priv->ra_info);
+	if (priv->rtl_chip =3D=3D RTL8188E) {
+		for (mac_id =3D 0; mac_id < RTL8188E_MAX_MAC_ID_NUM; mac_id++)
+			rtl8188e_ra_info_init_all(&priv->ra_info[mac_id]);
+	}
=20
 	set_bit(RTL8XXXU_BC_MC_MACID, priv->mac_id_map);
 	set_bit(RTL8XXXU_BC_MC_MACID1, priv->mac_id_map);
@@ -5385,7 +5388,7 @@ rtl8xxxu_fill_txdesc_v3(struct ieee80211_hw *hw, str=
uct ieee80211_hdr *hdr,
 {
 	struct rtl8xxxu_priv *priv =3D hw->priv;
 	struct device *dev =3D &priv->udev->dev;
-	struct rtl8xxxu_ra_info *ra =3D &priv->ra_info;
+	struct rtl8xxxu_ra_info *ra =3D &priv->ra_info[macid];
 	u8 *qc =3D ieee80211_get_qos_ctl(hdr);
 	u8 tid =3D qc[0] & IEEE80211_QOS_CTL_TID_MASK;
 	u32 rate =3D 0;
@@ -7892,6 +7895,16 @@ static int rtl8xxxu_probe(struct usb_interface *int=
erface,
 		goto err_set_intfdata;
 	}
=20
+	if (priv->rtl_chip =3D=3D RTL8188E) {
+		priv->ra_info =3D devm_kcalloc(&interface->dev,
+					     RTL8188E_MAX_MAC_ID_NUM,
+					     sizeof(*priv->ra_info), GFP_KERNEL);
+		if (!priv->ra_info) {
+			ret =3D -ENOMEM;
+			goto err_set_intfdata;
+		}
+	}
+
 	ret =3D rtl8xxxu_init_device(hw);
 	if (ret)
 		goto err_set_intfdata;
diff --git a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h b/drivers/ne=
t/wireless/realtek/rtl8xxxu/rtl8xxxu.h
index debaaad217e0..6d3b65ee9cc5 100644
=2D-- a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h
+++ b/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h
@@ -76,6 +76,7 @@
 #define RTL_FW_PAGE_SIZE		4096
 #define RTL8XXXU_FIRMWARE_POLL_MAX	1000
=20
+#define RTL8188E_MAX_MAC_ID_NUM		16
 #define RTL8723A_CHANNEL_GROUPS		3
 #define RTL8723A_MAX_RF_PATHS		2
 #define RTL8723B_CHANNEL_GROUPS		6
@@ -1921,7 +1922,7 @@ struct rtl8xxxu_priv {
 	struct rtl8xxxu_btcoex bt_coex;
 	struct rtl8xxxu_ra_report ra_report;
 	struct rtl8xxxu_cfo_tracking cfo_tracking;
-	struct rtl8xxxu_ra_info ra_info; /* 8188e specific */
+	struct rtl8xxxu_ra_info *ra_info; /* 8188e specific */
 	u8 dynamic_tx_rpt_timing_counter; /* 8188e specific */
=20
 	bool led_registered;
=2D-=20
2.56.1

