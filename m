Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690690;
	b=SX0Zg1tN3QIGdbrXSokiJyk90uhGkNMRHhVGiQlQez6nc7wUi0t9Wv9dy0wcqFbuQOlc
	 4KNP7f4cFIuHlrpsxXpdpH6ilqq6nPjQatYCWocZjf7ClSeu4ugQ0nTHblRYHScVqx0fo
	 x5JmciosYXce4VIEYtIcOpa57BeEAQvlwxi1JTdH1BjqlAr0qX7uD5ZUCBeTpVBiBTQyE
	 eYSEx9uzYYqSdptWNH7NNq6jyAwvRR0nMRg6RZ/145oFSVJhWzskx3pGXxMg/YQqTdIgE
	 WBKrye/RakQdyl2sM5aW64xc3/NEX98ANxiQ68e61WSBXvyJapZt1Vf03ZbveW7i3NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690690;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=1cQcKGmy5Z3zs09Pev822hrVLf/mcrwuq0GMb/ZzUmg=;
	b=ChGmrPHlcv6h8BBskymwkYTTaDMppP17acBb8BUc/2XlB2ZaGYzBH9bI0nao3ptlG4dW
	 +rnBTqKjoe6GprA8eG2pZtRV6JVdLzF2qXirQkY7IeyMNb+H+BHlo5Qza14MhBooCOYiz
	 PZ5Hpfbp9/ejPRpwVZyhFX5a85C1ssb2OwqzBGxfJrRKMMH8BJ2e8dZY/91adyrpYtA04
	 7ggmz978ZngS/UmR5m/jRyeUGXtT8zbqsDbTlfUfzoZCteI97lmioVC3+JtseQYrj7V31
	 6kXxML+fmGXxULFe2TIYvz+jlcsXjsDZtfPMVA5Cawg39NuwcrYmWVXOyZD4YP/uRfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.net;
	spf=pass smtp.mailfrom=gmx.net;
	dkim=pass header.d=gmx.net header.i=georgmueller@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b="q8/4gRiI";
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19AB606A32E
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 10:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F19AB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=georgmueller@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=q8/4gRiI
DKIM2-Signature:  i=1; m=1; t=1795690688;
 mf=PGdlb3JnbXVlbGxlckBnbXgubmV0Pg==;
 rt=PGxpbnV4LXdpcmVsZXNzQHZnZXIua2VybmVsLm9yZz4=;
 d=gmx.net;
 s=s31663417:rsa-sha256:B1X4W0fw83wfZ3+Hv9TJVKWhGwhg
   LVEcqZu3ztNtH3XCYu5acnSBCVAy1lSn/0imLGehsmOPeWjI/IQ9i8J+tmNeimL4EC0KaWt3QpX
   RcuWRy/y2J7lVRhjbdDsIwDAeTI/9CEw+xEyjPDy6oXFDQs4CNCXqC64XzKAbtjQ9RtQpxR0yTl
   fRuzmlRv18JAr3tcxOE2G9twrIkihu11rOBd5bnjTDaP6Ruw8cAlnlkDKZwHqmbCfdMpNT86EnP
   OqO8v1siL3UtfQo9xoZU27dlhjLvLfwXY+YRXvml0oUnAOsmaU3f8nd/vUz9a13ooyN5ZCAKzwV
   SzDCVI14YpgkGQ==;
Message-Instance:  m=1;
 h=sha256:
   P3CKw6oxebC8qT2MElfQtOyyPP6GAx/uDCbtTU4izeE=:
   3SsFDzzPPym/iY8OEAWfpPzIrczPcZryuDi1qjZ4UZw=,
  sha512:
   zSIydhCvoPQQpsxWXicxw0s+wORN0CKM4OXcVBnT3PHeMyr2NHea54BgRiXWqUoqsWZ5HOTtbFTAbralhc8bLQ==:
   ClIhKau9NNtXATAN++fVOCKCgJ7etaKM+zB9pjB0p606K+F+RxGZz5V51PAaXH/PU0ugMl11eVhuVk8UVlrQEg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1795690667; x=1796295467; i=georgmueller@gmx.net;
	bh=1cQcKGmy5Z3zs09Pev822hrVLf/mcrwuq0GMb/ZzUmg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=q8/4gRiIlGGoHap1oQyBmWSFcnRmelO5bBYci2jIYw2cL2lPXOi8LOJ7ctHfFgCx
	 27sU+/mv+rtNOXZ0ByAOxrxiz7RvvfVI/sfIofr2NXfQJ8TTLjoHodYursIZ7erit
	 04CJ0kFL4guYggQQ3AaLVO+9kvtlOzFjjb0mRlm0EU4ulKQ9Qc7S04QTEfLn4LvCl
	 Ang91liPzySUbWmUVcUGwwqvRMyQUDO1aeYsNRDqe/ere7r0pIxEjdlzJqvTYY4PM
	 EjRSMMXmjk1qzrM/CvPu7DK7clKd3ORMtEZ+aQ/dXAo7v9TXnZHTcxGE7kA8aoW7E
	 yWevHaB56HwDOPk39A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mg6Zw-1y9iTd25J0-00kTeU; Thu, 26
 Nov 2026 11:57:47 +0100
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
Subject: [RFC PATCH v4 0/5] wifi: rtl8xxxu: implement AP mode for 8188EU
Date: Thu, 26 Nov 2026 11:57:37 +0100
Message-ID: <20261126105742.1086282-1-georgmueller@gmx.net>
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
X-Provags-ID: V03:K1:0FQZDNeVfCRW3y6sjl4O5ERxMfjwuvEdiTDd2R7jhdJhUs6pkdK
 rcxazsPVnVwtvggUK0y5o4a/B/Na2hEK1HqRqi2PaP+9dlUgpD0Vjklp7xWmbE/1cdcN+Wn
 5r+EZekZxNXJb/hKynflcmMZ/27i/RCluLIprcKRjmVN098ICPN2+FxvZTssXLtqxZIEp5o
 L7f0xbdBmujpajbnmmTfw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:T9FNlCsyysM=;kt6x1LBtlHNZRoArhTruWEmLY8L
 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
 LC5/dGMleV7m8acSmjun8Hj+fogqBJo=

This series tries to implement AP mode for Realtek RTL8188EU chips.

As requested by Mehmet, this is my current state so he can continue
with it. It builds, but I did not test it on hardware since v3.

Still open, see the discussion in the v3 thread:
- RTL8188E_MAX_MAC_ID_NUM is still 16; Bitterblue suggested 64.
- Beacons: the hardware clears the beacon queue after the first
  beacon (REG_MBID_NUM), and the TBTT hold time differs from the
  vendor driver. Mehmet has fixes for both.
- Enabling AP mode (patch 4) should move to the end of the series,
  after the beacon fixes.
- max_ap_assoc_sta is max_macid_num - 1, but mac ids 0 and 1 are
  reserved, so the last allowed station is refused with -ENOSPC.

=2D--
Changes in v4:
- add commit messages and missing Signed-off-by
- allocate ra_info with devm_kcalloc() on the USB interface in probe
- limit the TX report items to RTL8188E_MAX_MAC_ID_NUM
- refuse stations whose mac id has no ra_info entry
- add patch to set the macid in the TX descriptor; fall back to
  ra_info[0] when macid is a security CAM index
Changes in v3:
- fix compile errors caused by testing on machine with older kernel
Changes in v2:
- add patch to move dynamic_tx_rpt_timing_counter from ra_info to priv
- convert ra_info to a dynamic array
- update max report mac id after station add/remove

v3: https://lore.kernel.org/all/20260313135321.3196688-1-georgmueller@gmx.=
net/

Georg M=C3=BCller (5):
  wifi: rtl8xxxu: move dynamic_tx_rpt_timing_counter from ra_info to
    priv
  wifi: rtl8xxxu: handle rate control per mac_id for 8188e
  wifi: rtl8xxxu: update max report mac id on station add / remove for
    8188e chips
  wifi: rtl8xxxu: Enable AP mode for RTL8188EU
  wifi: rtl8xxxu: set macid in TX descriptor for 8188e

 drivers/net/wireless/realtek/rtl8xxxu/8188e.c | 28 +++++----
 drivers/net/wireless/realtek/rtl8xxxu/core.c  | 57 +++++++++++++++++--
 .../net/wireless/realtek/rtl8xxxu/rtl8xxxu.h  |  5 +-
 3 files changed, 72 insertions(+), 18 deletions(-)


base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
=2D-=20
2.56.1

