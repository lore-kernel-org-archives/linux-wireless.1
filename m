Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795546769;
	b=kfe/MTZsch50oY8S31vr4S0Dh6rTvhuM7jsQbHqIylUmpJzZa8wwRq7x1KTMxAhm2XRX
	 3EHhlpQfCvLSpbgtaB25/wFp8LyHx8Yo37r4zLgUvgoXgUfgszFOnBszQ0yv/tXRlsa+M
	 yx2S3NW6PXE8qbQZbrD7fyTPyCCOhwjcp6WravbRQF/XOgKiD3H7l+KdVEjD5caj1xZXa
	 K2KXyoxsj+1eQH622oU3dtgTh+v0eI29Co52RJAEA9PcUMnCtQtZ7WVCShSet8hVS1JmV
	 Gjiqmp7uCLKWizXswJ3llzz2TrKvv1jZ5abqODS5S/4fjMXnKt3SyIG7XxctLsqBaNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546769;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HaK7GaUzVRzqUau5lX+fa82B7WYrvdJzpCw0apArCnw=;
	b=CbR404gYESH62oAPDFtP46L8fNz4YeIEGxQNpY+jRx/pa02oaxsXL6HqrzJsqtH0jQuB
	 f67VDG9qVTFb8sFDaI+n3G8vEQOdK7LVEMLR7R/FJXSfPhwDeyHg4ap4DjaLsyd/akNJQ
	 ZDhlmmZaQFTx9wn/U0MvYT+HX4hiob427+P+78ppXgiEIefL9nI0pFBa2+JbWa6h7tLWR
	 RhjSTRHjcYZ6E+f3cBMISrNMNDBsD8UR4bCbe876l1yfQ8OL7UBDTZBoilXgt0URQyEjO
	 W45JVZOeUwLJ1ST/OZZzmHprgDbOjMbA8qsuMzs0p2lvNrMFIm/YGsNsz1Na0WDGbPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dmxBGFVi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F37606A323
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 18:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dmxBGFVi
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795546768;
	b=A7sCCMz7c4a5QG35OsyTCJU1SPlwr7DSUUdeZjvISE5eWHC3ZpE2P8G9pG39GbZK2Kib
	 0Eez9lSMY+gvyEwDJqgp7pccHx5Pd+Kf+tJrOcwXM7BgYiujhAVY5gmY8xtDZtJ+S+mlw
	 GuPB7f2lBCbaz+VVMkQm0lGcqtGAohaap749MEBFCvOGm6xhbKiufE4HHN/LdPPQEpLEv
	 wHXON/pThXt57tQHfIz+4kt5cLIC4MWgdL86Tg+CAX85FEhDDiYO1Q6hh7BR0k90O2D6a
	 gSlmMl2bmcqZEoZiRL+vcTBV7to7L7GJXkpT+ja3krfbqYWvhfi5PdCJVRZ86AfGoAA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795546768;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HaK7GaUzVRzqUau5lX+fa82B7WYrvdJzpCw0apArCnw=;
	b=hTIX1B1z30d0pQmrmjIunUG0ngMwu7Kp0kOLjZeCaqbSzVC/FtVJjqSF48w7RzbJb/Te
	 1+W/DRXI4S1mLzntkujH/PUdxKgROw2uyLHzxE0Im5mBEmPHl3dd3uHl8e/Jj4mwf0btT
	 JM/6kWNakZ7VN36RI6N0pCbKCnmNY97i7CWHPmQOvZOws/04ilCxVALsCIWKK9WXN3WYp
	 IQyw5KZlC4wwNIqo04Ds0DPFDsGAUYMO5mt9wAIEsO0IxY2JHUGTDtff1AQAsY56xd3Jw
	 QJDri9AeCRY3mJAylRETRXIGnXdR/0Q/bTi7q1rRsnz+Ilhuws32cDQecy9wmJ/WNIg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C68BF1F000D3;
	Tue, 24 Nov 2026 18:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795546768;
	bh=HaK7GaUzVRzqUau5lX+fa82B7WYrvdJzpCw0apArCnw=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=dmxBGFVilp+z5Tw4kVBvHzm072YpJGXz59d3ot9GGrdDe9aMHuI0iPN/PKZS5gyIm
	 jAPc45f4xDLyI5+FRNyt+H2QUssThifEXCackBKF4CY8sSmq+1XsoI0qRB6lqpiCjp
	 uAKHphvHx0l4qWGz95YUHFf3qFdiklk+BvHG5hVM6XCnA5rtGWL/iIUqguW22WmsCe
	 ZzuwSpjVZH8p2ujDTfQPuh9tvaAkRDaNDn9vWA2KOm7RN9QwkiWkRjKt+1fCmTWjpn
	 zxGKnNGLBb6dpzFHk/XbHFXI999BHsfa2i6DVxlpSQQaK5ie77fco62N79SaH1jDgM
	 /VzlykTWBBDLA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 253364CB45;
	Tue, 24 Nov 2026 18:59:19 +0000 (UTC)
From: Ofir Hadad via B4 Relay <devnull+ofear123.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 20:59:19 +0200
Subject: [PATCH RFC rtw-next] wifi: rtw89: coex: share air time with BT
 A2DP on 5GHz (shared antenna)
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
Message-Id: <20261124-rtw-next-v1-1-8f720c5cc759@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMT3aKSct281IoSXRNDE0PDpJQ081QTcyWg8oKi1LTMCrBR0UpBbs4
 gMZhipViIguLSpKzU5BKQgUq1tQDE09f6fQAAAA==
X-Change-ID: 20261124-rtw-next-41411bdf7e47
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, Ofir Hadad <ofear123@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5127; i=ofear123@gmail.com;
 h=from:subject:message-id;
 bh=NNgYfZ9g/mREBsGWcmLCTnJ+55Db0Jgecf0O5lR1Yoc=;
 b=owGbwMvMwCXGFdcreWLOL3/G02pJDNms99qMdVfvDrqf0Vh6M+S0Q9RSh7Msj1mOWqhx1Kd8T
 WNVmXCoo5SFQYyLQVZMkSXCYv+PxR+fn/75dZYUzBxWJpAhDFycAjCRcAmG/4X3ZzYf/WV//3hy
 JuP5Gx0JOWuOJK34LZ/67LJC1M8EznaG/75nFkw/zbFfJze6pPVmpb7yxIB3ebprbCY8XrgvV8j
 NhhMA
X-Developer-Key: i=ofear123@gmail.com; a=openpgp;
 fpr=5838BFF8A3F1E7CBF9F59A1A0A5E8D19C89CFA4F
X-Endpoint-Received: by B4 Relay for ofear123@gmail.com/default with
 auth_id=1628
X-Original-From: Ofir Hadad <ofear123@gmail.com>
Reply-To: ofear123@gmail.com
Content-Transfer-Encoding: 7bit

From: Ofir Hadad <ofear123@gmail.com>

On RTL8852CE with a shared WiFi/BT antenna (ant_iso 10 dB, seen on a
Lenovo Legion 7 16IRX9, subsystem 17aa:5852), Bluetooth A2DP audio
drops out for 100-600 ms every few seconds while WiFi downloads on
5 GHz. Video streaming triggers it: the player fetches a chunk at
3-8 MB/s about every 4 seconds.

_action_wl_5g() always selects BTC_ANT_FDD + BTC_CXP_OFF_EQ0. That
keeps the WiFi grant forced high (GNT_WL SW_HI), so BT never gets a
protected slot. btc_info during a download shows gnt_wl:SW-1,
tdma type:0, and bt_polut_wl_tx rising (0 -> 7 in 4 s).

Add an opt-in module parameter, btc_5g_a2dp_tdma. When it is set,
the chip is RTL8852C, the antenna is shared, A2DP is connected and
WiFi is a single station, use hardware PTA (BTC_ANT_W25G) and the
same TDMA policies the 2.4 GHz A2DP path uses:
  - WiFi busy:              PAUTO_TDW1B1 (W1 20 ms, B1 max)
  - WiFi busy + BT inquiry: PAUTO2_TD3050
  - WiFi idle:              AUTO_TD20B1
Other states (scan, connecting) keep the old FDD path. The idle case
matters: gating on "busy" alone was tested and failed, because each
video burst starts before state_map turns busy.

Measured on the laptop above (Ubuntu 7.0.0-43, same logic on the
Ubuntu tree), BT ACK gaps while streaming A2DP silence:
  - stock, full download:        8 gaps >150 ms per 15 s, max 422 ms
  - patched, full download 60 s: 1 gap  >150 ms,          max 165 ms
  - patched, 1.5 s bursts every 4 s, 60 s: 2 gaps >150 ms, max 178 ms
The user reports the audible dropouts are gone.

This version is ported to rtw-next and compile-tested only; the
runtime numbers come from the same change on the Ubuntu 7.0 tree.
Sent as RFC: is an opt-in parameter acceptable, or should this be
the default for shared-antenna RTL8852C, or is it better solved in
firmware?

Signed-off-by: Ofir Hadad <ofear123@gmail.com>
---
RFC: the patch adds an opt-in module parameter. Questions for the
maintainer are at the end of the commit message.

Runtime tests were done with the same logic on the Ubuntu 7.0.0-43
tree (Lenovo Legion 7 16IRX9, RTL8852CE 17aa:5852, WiFi fw
0.27.129.4). This rtw-next version is compile-tested only.
---
 drivers/net/wireless/realtek/rtw89/coex.c | 54 +++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw89/coex.c b/drivers/net/wireless/realtek/rtw89/coex.c
index 751ad0c..c50da67 100644
--- a/drivers/net/wireless/realtek/rtw89/coex.c
+++ b/drivers/net/wireless/realtek/rtw89/coex.c
@@ -11,6 +11,11 @@
 #include "ps.h"
 #include "reg.h"
 
+static bool rtw89_btc_5g_a2dp_tdma;
+module_param_named(btc_5g_a2dp_tdma, rtw89_btc_5g_a2dp_tdma, bool, 0644);
+MODULE_PARM_DESC(btc_5g_a2dp_tdma,
+		 "Share air time with BT A2DP when WiFi is on 5GHz with a shared antenna (RTL8852C)");
+
 #define RTW89_COEX_VERSION 0x09180213
 #define FCXDEF_STEP 50 /* MUST <= FCXMAX_STEP and match with wl fw*/
 #define BTC_E2G_LIMIT_DEF 80
@@ -1017,6 +1022,7 @@ enum btc_reason_and_action {
 	BTC_ACT_WL_2G_GO,
 	BTC_ACT_WL_2G_GC,
 	BTC_ACT_WL_2G_NAN,
+	BTC_ACT_WL_5G_A2DP,
 	BTC_ACT_LAST,
 	BTC_ACT_NUM = BTC_ACT_LAST - BTC_ACT_NONE,
 	BTC_ACT_EXT_BIT = BIT(14),
@@ -6474,8 +6480,55 @@ static void _action_bt_a2dp_pan_hid(struct rtw89_dev *rtwdev)
 	}
 }
 
+static bool _wl_is_station_only(struct rtw89_btc *btc)
+{
+	return btc->cx.wl.role_info.role_map[RTW89_MAC_0] ==
+	       BIT(RTW89_WIFI_ROLE_STATION);
+}
+
+static bool _need_5g_a2dp_tdma(struct rtw89_dev *rtwdev)
+{
+	struct rtw89_btc *btc = &rtwdev->btc;
+
+	return rtw89_btc_5g_a2dp_tdma &&
+	       rtwdev->chip->chip_id == RTL8852C &&
+	       btc->ant_type == BTC_ANT_SHARED &&
+	       btc->cx.bt0.link_info.a2dp_desc.exist &&
+	       _wl_is_station_only(btc);
+}
+
+static bool _action_wl_5g_a2dp_tdma(struct rtw89_dev *rtwdev)
+{
+	struct rtw89_btc *btc = &rtwdev->btc;
+	struct rtw89_btc_dm *dm = &btc->dm;
+	u16 policy;
+
+	switch (btc->cx.state_map) {
+	case BTC_WBUSY_BNOSCAN:
+		policy = BTC_CXP_PAUTO_TDW1B1;
+		break;
+	case BTC_WBUSY_BSCAN:
+		policy = BTC_CXP_PAUTO2_TD3050;
+		break;
+	case BTC_WIDLE:
+		policy = BTC_CXP_AUTO_TD20B1;
+		break;
+	default:
+		return false;
+	}
+
+	_set_ant(rtwdev, NM_EXEC, BTC_PHY_ALL, BTC_ANT_W25G);
+	dm->slot_dur[CXST_W1] = 20;
+	dm->slot_dur[CXST_B1] = BTC_B1_MAX;
+	_set_policy(rtwdev, policy, BTC_ACT_WL_5G_A2DP);
+	return true;
+}
+
 static void _action_wl_5g(struct rtw89_dev *rtwdev)
 {
+	if (_need_5g_a2dp_tdma(rtwdev) && _action_wl_5g_a2dp_tdma(rtwdev))
+		return;
+
 	_set_ant(rtwdev, NM_EXEC, BTC_PHY_ALL, BTC_ANT_FDD);
 	_set_policy(rtwdev, BTC_CXP_OFF_EQ0, BTC_ACT_WL_5G);
 }
@@ -11287,6 +11340,7 @@ static const char *steps_to_str(u16 step)
 	CASE_BTC_ACT_STR(WL_2G_GO);
 	CASE_BTC_ACT_STR(WL_2G_GC);
 	CASE_BTC_ACT_STR(WL_2G_NAN);
+	CASE_BTC_ACT_STR(WL_5G_A2DP);
 
 	CASE_BTC_POLICY_STR(OFF_BT);
 	CASE_BTC_POLICY_STR(OFF_WL);

---
base-commit: 8b29fd95e2d3cb80564eb7cb34248b844422ba1e
change-id: 20261124-rtw-next-41411bdf7e47

Best regards,
--  
Ofir Hadad <ofear123@gmail.com>


