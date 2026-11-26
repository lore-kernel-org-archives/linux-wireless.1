Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690701;
	b=d98NzMDErlmPh46p+sgxnmj6Y8N8k4NJMjqkkZMWgZXCoaX1m3cGSaLyoOodoZOEP/dW
	 MbXFQzuqziXPE+9LLOq5ftu4tsPtr5EV7OiKRwZqXcGE9RCFLelpqwBAaWzCPtqaYm0Qq
	 mLFfCdn5E0tXwUSWNnorP4aBrrYl31Bk/KYBh2iAX3m3n6sNh94nK2Pc+hj0Zq3EOtgay
	 lHbLRHkqaA4WGBvbGnzcVWeAHTM6i5PhvErIT0sg+rps3XiGDaERqTjd3kvv1XBCyNKqk
	 lvjZaztfTq7Hso3KqTe09Xv5jFUveMqryCaOsPAttPk+EngSDV8nClJRzdBHZKmOkgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690701;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=XqD4T/rJXkKY3nAMC1CL4BGNCQ7Oh6KwyE987LNhjQk=;
	b=eQmxDNN4FTBIfsyzeHwOWKopgutCGWH4tmoVIyf7DxbOSfYKLRwUpyHXw+RfUTogNQfb
	 r0BIOBk5P8RbTJIxVaHSISndD2j9eV56T3ae0mSyj0o/pkRd80aJPqUADZjpoK2JaoXSf
	 IIhDejOqt2HKiZOpQ8WWPCSHOcVTXs//pwd3v8B/ov9oo4hD1XsI+kWBgMR70g0n69z+M
	 UhXwNb2lLPc5+EU3o6L8iLOV1OAf4G0hamTFdXXjiexs4hKozex8citFNf9t0J3F5anAz
	 NLoUqBBahlaveFprOl3UrbEDIOmCblcGTacChjUEabzfvsqT4kvFNQIoVgPehxGMibw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.net;
	spf=pass smtp.mailfrom=gmx.net;
	dkim=pass header.d=gmx.net header.i=georgmueller@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=tRRwVp5x;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CBB606A334
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 10:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04CBB606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=georgmueller@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=tRRwVp5x
DKIM2-Signature:  i=1; m=1; t=1795690699;
 mf=PGdlb3JnbXVlbGxlckBnbXgubmV0Pg==;
 rt=PGxpbnV4LXdpcmVsZXNzQHZnZXIua2VybmVsLm9yZz4=;
 d=gmx.net;
 s=s31663417:rsa-sha256:czLuVNDiKyqTfqOQktdZQ+aOPUvF
   tBlbbw0jvph/yS+gFOUqPhgyA4l8FYAF5o9JwMETsUzVkiI7Tr/9uf1lARsOLQ6HwcqUQDXShjQ
   FF1QCh89tNEJNyGsX3hMvabiQF7Q3L9UlpNncfoi91p40KNaHwJkCRYIX9ZdlffHRN9pCtDK4gR
   nQ4cXkX+o6Eggh1aGA9v8TUEKUWISd8MXtC7mqY64uptKR0b2dFmHQUg1qJuT5AzLTt1bH+HL8Z
   2ybNya2+yz5w2yk9CYchCHx94sPHaF6wu1nkJiylrjg2CyH+1Ui250EosYIUANrJMSg+tFoOOa+
   T9sADtfki2KHiQ==;
Message-Instance:  m=1;
 h=sha256:
   q5kkJvn/DL1CFk3rwBrfkBx4NmlIQ3hWXHtS/p9gz7k=:
   y6tED1Ozof3mdr+Soixfb1UtT4+kLrHodnzPzW38iTY=,
  sha512:
   G38LvOv6F3KMItcn8PYU3R66uf/utKFus+Jj9HgU4gLwVpze5Pt3RfQlCfrSqbL6iNWKaM4gSWQ5bpQ9x2wc1A==:
   6FGcp8a8NjXR44hhHVamJ7KeLEbb2jcUWhwkzaAc7QXBq4Mwg6UELxs70xeDnjGsuWR8TNDMv5D8dZx8xa8zLg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1795690688; x=1796295488; i=georgmueller@gmx.net;
	bh=XqD4T/rJXkKY3nAMC1CL4BGNCQ7Oh6KwyE987LNhjQk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tRRwVp5xBoBakFauiDDoFqbTon8C05gnekd7b8qbSgL3Vn5lLR5i7sxBU2mE0iV/
	 1HYS7z64NyM94v1PM+HqbLjpCau520wJhcvsJ6P9UK0WldtpVDrxB4ZsWJXeBwrI5
	 e+oq66+6U5PIMDH6+80Jda8XoOkcZByETLfm3DZJzl3H8e4MPL0HtUvNMh6jHykux
	 Cy5hMXbz7B01LWx8M+wtp4XLdL9HzWbctUHU5FsWJHgEf9umVCpzVscdHl+OtnIaa
	 onxNGQBlEUJZj+Ozlh0/4+0h30CFF14aTPdcm6Q1j8ooWIHTz6KR9fEORm71dLujD
	 ysn5qhnPYGNucXtgRA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MuUj2-1yO5XG2Vgg-015Swg; Thu, 26
 Nov 2026 11:58:08 +0100
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
Subject: [RFC PATCH v4 5/5] wifi: rtl8xxxu: set macid in TX descriptor for 8188e
Date: Thu, 26 Nov 2026 11:57:42 +0100
Message-ID: <20261126105742.1086282-6-georgmueller@gmx.net>
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
X-Provags-ID: V03:K1:qV3B8ESq5fHhao8CczfSw5I8CYzTw/eTViVpLjot6EoiHWeKfqC
 eszeoJeS8tEjdVgohNQHvszbexNuGyc9wYyJKOKibwm8qvRZUgwhoIKc/u3UGFniAysjWg+
 ruAeOTcfN56EYUNOl0OCV/38tkMj5sVdV7Yv9SgbIfpMzW+/Z/y2gVPAzLYJVBIfd47ugF6
 C/rpxzSBWG01E8zl7jUWQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:K/dY/bD6fBs=;veh9GAHtKQj/G0gcmUHo8wAFMmg
 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
 A==

rtl8xxxu_fill_txdesc_v3() does not set the mac id in the TX descriptor,
so the hardware treats all frames as sent to mac id 0. The vendor driver
sets it in txdw1.

Set it, so that the TX report attributes the frames to the right
station and the per mac id rate control works in AP mode.

Signed-off-by: Georg M=C3=BCller <georgmueller@gmx.net>
=2D--
 drivers/net/wireless/realtek/rtl8xxxu/core.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtl8xxxu/core.c b/drivers/net/wi=
reless/realtek/rtl8xxxu/core.c
index 4207e68ccde0..87526c051a31 100644
=2D-- a/drivers/net/wireless/realtek/rtl8xxxu/core.c
+++ b/drivers/net/wireless/realtek/rtl8xxxu/core.c
@@ -5397,7 +5397,7 @@ rtl8xxxu_fill_txdesc_v3(struct ieee80211_hw *hw, str=
uct ieee80211_hdr *hdr,
 {
 	struct rtl8xxxu_priv *priv =3D hw->priv;
 	struct device *dev =3D &priv->udev->dev;
-	struct rtl8xxxu_ra_info *ra =3D &priv->ra_info[macid];
+	struct rtl8xxxu_ra_info *ra;
 	u8 *qc =3D ieee80211_get_qos_ctl(hdr);
 	u8 tid =3D qc[0] & IEEE80211_QOS_CTL_TID_MASK;
 	u32 rate =3D 0;
@@ -5405,6 +5405,14 @@ rtl8xxxu_fill_txdesc_v3(struct ieee80211_hw *hw, st=
ruct ieee80211_hdr *hdr,
=20
 	seq_number =3D IEEE80211_SEQ_TO_SN(le16_to_cpu(hdr->seq_ctrl));
=20
+	/*
+	 * For group addressed frames with a key, macid is the security CAM
+	 * index, which can be beyond the end of ra_info.
+	 */
+	ra =3D &priv->ra_info[macid < RTL8188E_MAX_MAC_ID_NUM ? macid : 0];
+
+	tx_desc->txdw1 |=3D cpu_to_le32(macid << TXDESC40_MACID_SHIFT);
+
 	if (ieee80211_is_data(hdr->frame_control)) {
 		rate =3D ra->decision_rate;
 		tx_desc->txdw5 =3D cpu_to_le32(rate);
=2D-=20
2.56.1

