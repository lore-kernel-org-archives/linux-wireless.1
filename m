Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477075;
	b=Vy1/WzuyfGao+WrBQruLzzIJWx+wnhj781JJwnG+XRGGeonYTwymoBuguB3oSsuIjV91
	 bkdHyZ/H1wGSGof+r4lZuGbKyjuLf+j7FVt7HC+MSZyq3VroimG6n0cZx1+cYF51OQ7Cr
	 ShoUYHVNGnJDWo03xU51GXOwqLA00zVncYzwNmvV8Up3R1/Cli9r+IacEcRupkQM3UEqi
	 3NwGkiEoJyhv0LgvlYzMLakATe6ZThaQ3oGC4e53Zk9agwVSJoV6v3pMPXU8iLeCJUtIB
	 tKR3NT4YAmJFka+JMixcbn3/svG7gFhqhc0NYy8hEYfcNB0IyrsbhpJL0bAwvQgOIsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477075;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=sE5nDKAHylHfXNljU8ESqvkfFS6Rp3ffmStIQMjK4pg=;
	b=JwpzmVZdtCBoHDV47E79h9xAqtxW6MOYcaC++KKNZ3JswJiW4XphIpiKj3XPwTfukOcK
	 9nFAk93L/TyPFSz/9oOgq8cZi3gtKJgqUU/dVCGjTRxh7/gmK9M7Y5c/V9DQL6UXpcqM6
	 N+qkRUGaSevZbUMIUVOqUC9QofPx3WJWJYfqS1LnEYr23Sm3v7KF/+/ITXx1fjEyouIWc
	 t2aefRJfEPb1MtWtGPl52E97Vk2BFDykvJrMuosU+NHuWhYWjTZMX0G1cd6kXmyV69XC6
	 K3XUfo4oRiDPP5bUYqmg0vioDMNJW2osonVMcNYXonLXgdhKbBedon++afH41r0zLHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QrRjJa0d;
	arc=none smtp.remote-ip=95.215.58.183
Received: from mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BA4606A31E
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 23:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77BA4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QrRjJa0d
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QkepU0YqvWHLf6nRIVGbSSor8TIXHFH03gy6YgNP/ns=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795477071; v=1; x=1796081871;
 b=QrRjJa0dFk7T4SQPmk1M9HOOHrG8Z72w8xtVPEHcVhFFrJ9YutGA8CAPtO4McMfsmtEcksbj
 xs5gqltlH0qtQRy3IzF553EkMBCBtPIF4iaHMot2O0XCFDxZsP1TFOnN7RqxzV4QfT44N4ujrZQ
 xMX10GnVER16eqnrPkwYgtos=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 58d118af36727f68;
	Mon, 23 Nov 2026 23:37:51 +0000
X-Mizu-Trace-ID: 58d118af36727f68
X-Migadu-Flow: FLOW_OUT
Date: Tue, 24 Nov 2026 00:37:49 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: Sascha Hauer <s.hauer@pengutronix.de>, Zong-Zhe Yang <kevin_yang@realtek.com>,
 Tzu-En Huang <tehuang@realtek.com>, Yan-Hsuan Chuang <yhchuang@realtek.com>,
 Kalle Valo <kvalo@kernel.org>, Stanislaw Gruszka <sgruszka@redhat.com>,
 Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, mehmet.fide@screeningeagle.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v4_1/4=5D_wifi=3A_rtw88=3A_free_the_?=
 =?US-ASCII?Q?reserved_pages_of_an_interface_on_firmware_recovery?=
In-Reply-To: <20261121191528.591334-2-mehmet.fide@gmail.com>
References: <20261121191528.591334-1-mehmet.fide@gmail.com> <20261121191528.591334-2-mehmet.fide@gmail.com>
Message-ID: <38F350DD-D749-4754-AF9D-EBA4F8B430E6@linux.dev>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On November 21, 2026 8:15:25 PM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:
>From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
>After a firmware crash, mac80211 adds the interfaces again without
>removing them first. rtw_ops_add_interface() then reinitializes the
>reserved page list, and the pages allocated before the crash leak:
>
>unreferenced object 0xffff0000cbe22c60 (size 96):
>  comm "hostapd", pid 25545, jiffies 4296463067
>  backtrace (crc cbdc21c4):
>    kmemleak_alloc+0xcc/0xe4
>    __kmalloc_cache_noprof+0x234/0x3bc
>    rtw_add_rsvd_page+0x38/0xa8 [rtw88_core]
>    rtw_add_rsvd_page_bcn+0x30/0x58 [rtw88_core]
>    rtw_ops_add_interface+0x144/0x2cc [rtw88_core]
>
>mac80211 zeroes the driver data of a new and of a removed interface, so
>track in struct rtw_vif whether the list was initialized, and free the
>old pages when the interface is added again. Until then the pages stay
>on the list, so a download before the reconfiguration, from the beacon
>update work or a WoWLAN suspend, still finds them.
>
>Fixes: 5c831644e1f4 ("rtw88: handle and recover when firmware crash")
>Suggested-by: Zong-Zhe Yang <kevin_yang@realtek.com>
>Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
>---
>

Looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
