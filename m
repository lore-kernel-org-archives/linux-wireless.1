Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690697;
	b=G2MBP7Li6w4s262VgbSpkMTjHywxbpW5eKOwzLe3VhoiC4tjw1w0BNIWH4secrvI2fSR
	 P1940hjpddP+5jhjTmutsFpaqW1W8IRMCWNc0drJHRFUBmVIAssFNyLQBeepTiHLFYksZ
	 baxbDavwGkMEZCL5uFQYynLodDbvHySX3EN+PdrflUnPITn2nsJgYs7+TX8lNXKjzTNyF
	 8wnL9tHoGPZ4UtuIk4tKiEbtQyndA1BXehEwOkx5V9tMGSPf8Y/sDVUQ32UiT4G5J0dC+
	 XGXUF2pggujxKtkuBbuCmG3QZMpPmH2jEVNndcSTmHV8tIH8Z4AKnoXJBMhbDlm+meg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690697;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=kolY+D2wI8M531ZXfEYNnu3MbTcxUK9LyBbwugukZCs=;
	b=fjQX+zTjO0e7hAHtabFLIZU3WU6YuZi1m/9D7VQQhnN8oF+iSKFJ/j19Of6lcJCTmeFf
	 JoG9E2T9mRTKN3AEGwlrP+gWwUQMLumPKdkYFYZBfFVby++KcYUGUUgIjlDsiHCanwPEi
	 g5taKmzqQamFpfft2kZUt4OfzeOMq6a439+U1wXmI5WWMiGv7zStq8kQ0pb4vTYwhfVD6
	 BTSznDgfhe32xz8y4pL1t4sKqCLUW/xsl8LFkdb+nOCVqW0LqFg6rLkeBL/0OZTuffmJK
	 1HcqfOIVyz2MAKWq8g4TuzLBYUVHsHRAiP+em4VxYTmdRlK66Sx9X0glZisMiE+Vv6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.net;
	spf=pass smtp.mailfrom=gmx.net;
	dkim=pass header.d=gmx.net header.i=georgmueller@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=ZJjzTDvx;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B12606A335
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 10:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59B12606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=georgmueller@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=ZJjzTDvx
DKIM2-Signature:  i=1; m=1; t=1795690694;
 mf=PGdlb3JnbXVlbGxlckBnbXgubmV0Pg==;
 rt=PGxpbnV4LXdpcmVsZXNzQHZnZXIua2VybmVsLm9yZz4=;
 d=gmx.net;
 s=s31663417:rsa-sha256:GIpjqDWQPNQxuqgucV7LQ6/7tZd+
   YaJ1uR4miqL+9+rVFAnH93Qh6QWTNH66Wm/Lyx8gn6BFDzeYLm3osFmvDabTchXzMy+zKptciNU
   xWm2qB/j1A2MHxQy/LViTjIHWB66uwlp0CwCzcUY7JR2D+cyHP47TpDTCyVxpHzxa/7rIoZWclt
   B6FKamaybWx+pmh5dDufuf5VfMKSqWDKOWQ8KRGyHnH5KaamIKqCBfJ0O05ZaVFIEtIFU/oq3z2
   0QY2J9BIB+YZtH3tKLIwmc8aWZQcD0TUDjwvoTgAEcC5X0FoFYjc6QomY0WTnXhxe1qOlnl9KQV
   oDAez/sbxzTweQ==;
Message-Instance:  m=1;
 h=sha256:
   sjRh62CCJh6zmeB+GtOvvs0+KdiQ2UuQe/MNf+Ay6U4=:
   tGwakyyWGl7bvF2jZ/P4frvd22VNg9K06a/+Nwq0lKs=,
  sha512:
   yXoKdSo6KGaAyMVXrKnKsVDmOHX0hmG6qzGJ4kfpFf16Z189Hq//5+pQE5xex7KCnY64KeLb+bxN4PwYvuwCig==:
   ja3iUVh/c5StSCuWU0g5G4gOe9GjHHRtiIv/GuzsNnI7FCF27t4oD2f6NZHSVxZWhzBJBJJL4qlmIDA6bNz4rw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1795690682; x=1796295482; i=georgmueller@gmx.net;
	bh=kolY+D2wI8M531ZXfEYNnu3MbTcxUK9LyBbwugukZCs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZJjzTDvx+fTPg2uaXZHQrS/9kk1fuPHl7i6UZhp6CcrYvxoTTJDngIWm/JWMI1CF
	 lWtxxWYui/iINDxftjNR49p3+pgZILE4qxo8YcqQB2q6OVXmoJ685kIrOpyHCoCvJ
	 d1S2yVtKimTJRywTT8Dzmcxe5rn2pgS3DMmvx86+Efc+qygIMgsmEStghMtVtaLRN
	 Wvc9bXuldarqSxsoMgqrOkBNzVG5AW8Pu4NbzQMVc9te8hCAEssjBLL7PHUxxmu88
	 HloOCbWWuaZzdwp/zt+brFUlDajGg2f9rt7TbnydLydfn+6O2JZKwgmZTy9B1akLb
	 9NHojfhIEjuuQktIog==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mg6Zw-1y9iTP2SLe-00kTeU; Thu, 26
 Nov 2026 11:58:01 +0100
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
Subject: [RFC PATCH v4 3/5] wifi: rtl8xxxu: update max report mac id on station add / remove for 8188e chips
Date: Thu, 26 Nov 2026 11:57:40 +0100
Message-ID: <20261126105742.1086282-4-georgmueller@gmx.net>
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
X-Provags-ID: V03:K1:aDrND/kJLvxMtPbeaRnmvw09P8oYxyd2y9hJXzU7oDqFgMQaQC/
 qgMXmvlPkRNnQtkDY5EYeoLH5jzic33FX1fdgJuA6Lr5m5OMc0mH4X/0ZLcVWL8mN20mbTk
 xwNi4YPpuQ4H/BqY2m9TecWPQeCP/9OhdmCL09+vOLZRGc/JNijvsc3A3n1x+wk9CSeDKIO
 g4DlMoQfV6wZif3Y2kffA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8LxtofL0rYM=;qXgWI+bopcbzbiPsYiwy+7dPuDO
 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

The 8188e only includes the mac ids below the value in
REG_TX_REPORT_CTRL + 1 in its type 2 TX report, which is used for the
software rate control. rtl8xxxu_init_device() sets it to 2, which only
covers the mac ids used in station mode.

In AP mode, every connected station gets its own mac id. Set the
register to the highest acquired mac id + 1 whenever a station is added
or removed, so the TX report contains the entries of all connected
stations.

Signed-off-by: Georg M=C3=BCller <georgmueller@gmx.net>
=2D--
 drivers/net/wireless/realtek/rtl8xxxu/core.c | 30 +++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtl8xxxu/core.c b/drivers/net/wi=
reless/realtek/rtl8xxxu/core.c
index e3266ed9c302..4207e68ccde0 100644
=2D-- a/drivers/net/wireless/realtek/rtl8xxxu/core.c
+++ b/drivers/net/wireless/realtek/rtl8xxxu/core.c
@@ -3886,6 +3886,15 @@ void rtl8xxxu_init_burst(struct rtl8xxxu_priv *priv=
)
 	rtl8xxxu_write8(priv, REG_RSV_CTRL, val8);
 }
=20
+static u8 rtl8xxxu_max_acquired_macid(struct rtl8xxxu_priv *priv)
+{
+	u8 macid;
+
+	macid =3D find_last_bit(priv->mac_id_map, RTL8XXXU_MAX_MAC_ID_NUM);
+
+	return macid;
+}
+
 static u8 rtl8xxxu_acquire_macid(struct rtl8xxxu_priv *priv)
 {
 	u8 macid;
@@ -7566,6 +7575,7 @@ static int rtl8xxxu_sta_add(struct ieee80211_hw *hw,
 	struct rtl8xxxu_sta_info *sta_info =3D (struct rtl8xxxu_sta_info *)sta->=
drv_priv;
 	struct rtl8xxxu_vif *rtlvif =3D (struct rtl8xxxu_vif *)vif->drv_priv;
 	struct rtl8xxxu_priv *priv =3D hw->priv;
+	u8 max_mac_id;
=20
 	mutex_lock(&priv->sta_mutex);
 	ewma_rssi_init(&sta_info->avg_rssi);
@@ -7577,6 +7587,18 @@ static int rtl8xxxu_sta_add(struct ieee80211_hw *hw=
,
 			return -ENOSPC;
 		}
=20
+		if (priv->rtl_chip =3D=3D RTL8188E &&
+		    sta_info->macid >=3D RTL8188E_MAX_MAC_ID_NUM) {
+			rtl8xxxu_release_macid(priv, sta_info->macid);
+			mutex_unlock(&priv->sta_mutex);
+			return -ENOSPC;
+		}
+
+		if (priv->rtl_chip =3D=3D RTL8188E) {
+			max_mac_id =3D rtl8xxxu_max_acquired_macid(priv);
+			rtl8xxxu_write8(priv, REG_TX_REPORT_CTRL + 1, max_mac_id + 1);
+		}
+
 		rtl8xxxu_refresh_rate_mask(priv, 0, sta, true);
 		priv->fops->report_connect(priv, sta_info->macid, H2C_MACID_ROLE_STA, t=
rue);
 	} else {
@@ -7602,10 +7624,16 @@ static int rtl8xxxu_sta_remove(struct ieee80211_hw=
 *hw,
 {
 	struct rtl8xxxu_sta_info *sta_info =3D (struct rtl8xxxu_sta_info *)sta->=
drv_priv;
 	struct rtl8xxxu_priv *priv =3D hw->priv;
+	u8 max_mac_id;
=20
 	mutex_lock(&priv->sta_mutex);
-	if (vif->type =3D=3D NL80211_IFTYPE_AP)
+	if (vif->type =3D=3D NL80211_IFTYPE_AP) {
 		rtl8xxxu_release_macid(priv, sta_info->macid);
+		if (priv->rtl_chip =3D=3D RTL8188E) {
+			max_mac_id =3D rtl8xxxu_max_acquired_macid(priv);
+			rtl8xxxu_write8(priv, REG_TX_REPORT_CTRL + 1, max_mac_id + 1);
+		}
+	}
 	mutex_unlock(&priv->sta_mutex);
=20
 	return 0;
=2D-=20
2.56.1

