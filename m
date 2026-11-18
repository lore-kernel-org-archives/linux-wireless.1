Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794967566;
	b=LqOSBEtVOyZuTTbd1ZG/T/kaCHNKyu/N05uQw2t0SWEBcb6PpEJhStRSCpI27KCoK2Pf
	 hmC193StE9rqlS2dX4nBbHUGo+D+pXu2M+4jp9BWKRsImbDyM31VaDO6nZYa1vLOWWc6P
	 0yKTbr/v3QSv3Rk0lSgBUtIJPdU4FaCU5UKG9vijdapx/nJ6/HcccNvVaZyiZANo7CNH+
	 v71rxDbvwVNYFQRZ93KXHB3W8QkqrmqAUrL3MNi4GhA0aRXujlwnG7LY6NFVXAdMNEoYP
	 HRJZWk9vNj/NXN/FOyIeNYCJOi9+akf670OMe35/35b0XzqaZ46wUT3PHXVhXWvJLFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967566;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:In-Reply-To:References:
	 Message-ID:Date:MIME-Version:Content-Type;
	bh=MA3jroYBMrib0INrMZsHd4EPR8od++oBGys3n7EDepg=;
	b=owTbRU3nBFIpB8mjRCzUcCk2PvmVGBHjuB5y6b4+yvwj56dAjE0XOdb9hUQUvICHqqy2
	 vVrPvw0DfoJWGyHjnUoYj0yqab4nCicRMmlkAj8jNCLCQBi/UHsglKrdC+/6g9qN3MHzy
	 tSwW4t/ijkEGOVA9HxBaMZJjGVUhRnWA0AiesZCAXcocUWlyNL3y3N6RW80p0eZ6YyV9z
	 Q32OAck3NXeK7uA9tRX629lVNlaZUabgji9Q9vW3K5MU00VaNBj8gv03wOvoPCD/7PqX4
	 0pnYHces0OTm87NC1jSBYy3/67RHv7hulMYfd7CsPQ65Hg7g+JgEozkomuaKGMaOY9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=cNmW34ZU;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EB5606A31C;
	Wed, 18 Nov 2026 02:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9EB5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=cNmW34ZU
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AI25bkK6866158, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794967537; bh=MA3jroYBMrib0INrMZsHd4EPR8od++oBGys3n7EDepg=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	b=cNmW34ZU2j79YAggK98TLKQVVYDIxNk0MqvHbmpBvrUHX3FBWo/skvkMUUxdIm92I
	 WaEqJKT8b7fImIgtrqVvuwqXimUla5/qsFNvIwDXkd2wLqXyYeVCHgZwRf17heA/gl
	 7ETOKXE2iD6UXyAi39ya/mtyFh6Tua7NmjoXU/h83DmTBfHpeOiyHR52XvN4Fw/tUq
	 wz5H+Fxd0zQbNpwH6RrNEm2OLJvQhlA9vJzWpyD/FnYv6h+5cYG7cCwg+gmDE8Evr9
	 MaX8gtkD5iS94DISOJmSXJStF+33dExQBijwCGIimo2sjcbhI1lntGXWXsdCYSkAOf
	 V0SYwVu0VeJ7w==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AI25bkK6866158
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 18 Nov 2026 10:05:37 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 10:05:37 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 10:05:37 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Wed, 18 Nov 2026 10:05:36 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Mehmet Fide <mehmet.fide@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: Luka Gejak <luka.gejak@linux.dev>, Bitterblue Smith
	<rtl8821cerfe2@gmail.com>, Yan-Hsuan Chuang <yhchuang@realtek.com>, "Kalle
 Valo" <kvalo@kernel.org>, Stanislaw Gruszka <sgruszka@redhat.com>, "Brian
 Norris" <briannorris@chromium.org>, <linux-wireless@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH rtw-next v2] wifi: rtw88: program the beacon interval
In-Reply-To: <20261117101419.1687892-1-mehmet.fide@gmail.com>
References: <20261117101419.1687892-1-mehmet.fide@gmail.com>
Message-ID: <e1412da9-4679-4e3c-9856-711fd75414e9@RTKEXHMBS05.realtek.com.tw>
Date: Wed, 18 Nov 2026 10:05:36 +0800
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Mehmet Fide <mehmet.fide@gmail.com> wrote:

> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
> 
> The driver never writes the beacon interval register, so the hardware
> keeps its default of 100 TU. An AP or IBSS started with another
> interval says that interval in its beacons and sends them 100 TU apart.
> 
> With beacon_int=200 in hostapd the beacons of an RTL8822CE, RTL8822CU,
> RTL8822BU and RTL8821CU are 102.4 ms apart on the air. The same holds
> for an IBSS joined with a beacon interval of 200 on an RTL8822CE and
> RTL8822BU.
> 
> Write the interval when mac80211 sets it for an AP or IBSS interface.
> Both beacon from port 0: rtw_core_port_switch() moves an AP there, and
> an IBSS interface is never combined with another one.
> 
> Reported-by: Luka Gejak <luka.gejak@linux.dev>
> Closes: https://lore.kernel.org/linux-wireless/1D396970-35B7-4B0B-82E9-24B523AD69C2@linux.dev/
> Fixes: e3037485c68e ("rtw88: new Realtek 802.11ac driver")
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

1 patch(es) applied to rtw-next branch of rtw.git, thanks.

0bdc579dbfc2 wifi: rtw88: program the beacon interval

---
https://github.com/pkshih/rtw.git

