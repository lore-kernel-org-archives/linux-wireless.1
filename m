Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795774492;
	b=10o3+SQaw6xm/DpCBy0B4X42HyF+KhtN8qlUEopv8zTPFNgDYO/JgY5jKpLn//z/zk7R
	 ewKehVymlG7CsckbhBeZxCAB//Qq9M3NC3d/LKV+A0RMIDPXrXCiCH9iMPG2CrGOGuo2V
	 x/JGPxrYfDR2l+WR0XuK7UPdls5HJ3q4sTnNi2+QSk42JmetWSohPVOYy5N4fisU5OaYA
	 4axj3PxZoIf7BgMG3w9b60Ow7q8Ru2Jm2eoBkm3LQGWxIAq4QxqZ+d5zYo5HwBF+HiHP4
	 961wBc/d8lswB1ZAwcQ4YfnLfl9hJEdgt3iPw9zSl3NyRtNFtoAMFnvNCEGTFS0dfZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774492;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-ZohoMailClient;
	bh=y3ME5dT+CtdNKNmuEoCoo/qW216nXznpu+the0RM00w=;
	b=pR1EmSbIwz3tGJl45+w3bDqg2LsBGpn1Sc2eMoSA/MapK+aJq+bQAQv1jWnvXWxeBfjG
	 7xBpDfH91W2fDFZXgEg/VNzOMdNinNlYMkR/7MWYRsv7M/QiTD6XBW3ttK41CRtmK/K6W
	 3VQbvr3gC5uY6bocJXUQaUaFtMErczSZ3wQHgoiUvvSXeVv1A9WygMQDr0pmit4ISURw/
	 2VCK99PnvVMLZB0vHcqhI/ukyQ/nuYTnTZJUjquaoWLGlUe5XPl1vyuu7GzRKtpXm3tl8
	 67OnCiyYqcbMJM/m8GBlmog3Plp5E4X1ec/i1888E9HZ7MUV+NjX2prh04rUF7IQimA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=godZnJwJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E34C6076C34;
	Fri, 27 Nov 2026 10:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E34C6076C34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=godZnJwJ
ARC-Seal: i=1; a=rsa-sha256; t=1795774394; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kRyDhGYbcrkJ0Ezx7Zauok9ez2ZHB+PPwHwyjaZ7y5sPDo5k7mMC2oe2KkeT8KA8hFcu0bbadIsJ4/iCQxdMj5cp8XFmot41MRq/xfK2mrz6RhS8g7ESOICfik2MwQ0sILI/+xxaTFV/ddiqWHXg8gVdvJwlWLvechZPuir4oA4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795774394; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=y3ME5dT+CtdNKNmuEoCoo/qW216nXznpu+the0RM00w=; 
	b=ce01K4aL8+UnLJdQiJzRqH1wIDOblP6/Ggvga5avagiCEUUiIAxGEcD6A7jCS+BDGLkZW4H6j9/LZOTFoXQzLS99lvo5lDWgDBKGs5Lfhw0eMK/QyFeGowc2qr/+zE00/WN9YhsHvna8+X7nljUZoeulbFJ6+8PHJnIaBjrxSBc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=godZnJwJNQCJGo00xBLbHASbqtVsmOazZsAN5lO62iSf53BweCJD5y/rsU+QYjJE/FYrz4Wvt68vp+pMb0V8pAB/wBSp2e55Jt/Wyf6fVd0UN6oHPCZvBBi7BhH/L8va3JUTl5HUIfn+F3Y+HrVIIOQoK3p9Gjk+q+UUHiR2PaXKzS9VP903yno0Y1GCxYx0NTTk0KtYS0lcsxmz9Aj6ZUrmSN0Y2V3iSYxfXWT/mDoUjH4cXOeenoCHD0FJ4tSiqGgR/j8TterbIhEH44equKFgCPIGxSXFJrfdVfhYdQCC4RmoO7Z9zaz4Xugh+lr8q+yC8UE5+we+COcOYMGCEw==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=y3ME5dT+CtdNKNmuEoCoo/qW216nXznpu+the0RM00w=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179577439280750.96349803260364;
	Fri, 27 Nov 2026 02:13:12 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Ahmet Zeren <niko3x@proton.me>,
	Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next v2 0/2] wifi: rtw89: fix injected retry limit and NO_ACK TX status
Date: Fri, 27 Nov 2026 15:13:05 +0500
Message-ID: <20261127101307.15-1-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
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
X-ZohoMailClient: External

Follow-up fixes for injected retry handling and NO_ACK TX status reporting
in rtw89, tested on RTL8852AE.

Changes in v2:
- Patch 1: reword commit message, keep RTW89_TX_DATA_CNT_LMT_MAX and use
  min() with IEEE80211_MAX_TX_RETRY, drop extra parentheses around '&',
  and drop unnecessary flag clearing in rtw89_tx_rpt_tx_status().
- Patch 2: keep pci tx_ring counters unchanged, skip TX failure debug log
  when NOACK_TRANSMITTED is set, drop unnecessary flag clearing, drop
  Fixes/Cc: stable tags, and reword commit message.

v1: https://lore.kernel.org/linux-wireless/20261126083141.1470-1-owner@ph4ntom-rev.uz/

Enver Ikromov (2):
  wifi: rtw89: fix retry limit and NO_ACK status for injected frames
  wifi: rtw89: pci: fix NO_ACK TX status reporting

 drivers/net/wireless/realtek/rtw89/core.c |  5 +++--
 drivers/net/wireless/realtek/rtw89/mac.h  | 11 ++++++-----
 drivers/net/wireless/realtek/rtw89/pci.c  | 12 ++++++++----
 3 files changed, 17 insertions(+), 11 deletions(-)


base-commit: 18d0bedbb5f0538396cb7f763ed9cd1dd69c5b23
-- 
2.53.0

