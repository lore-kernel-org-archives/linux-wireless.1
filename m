Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795397980;
	b=rcqiasHW9KjkfNBSICuHKL0Oz+D0TZTGVs6rj7TGOvyZqqDBZVUC7Kl4HAYtxyoKEwOQ
	 8yZvQMVFsiMaT7wOsmuWyu9SUGQdJ458n9jjwVmFuRF/vQw73GIoBuOrSPy9pgTS7waj0
	 XeXstM/Uz+4CdwrldWAi1sduf+DevPM7oIJ/lXf1pjdGVsf9vKeZyBa+L9Taosw6di7Ll
	 3lS3q4p1EUk/2cJjNpgAEYv6+eavzQIUCMsMS7nvGZ9hwCORT9DOwqptJ7ZxuQl0VLVJj
	 xqA3ASW3bBzvHn2EeetsXGFRhqa/yXP3VaFOrkwURqk+xwUjSE2+gL+YgpF3RfVUuuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795397980;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	bh=08ebP782mM89d57XiQanBzg+5eva9CillFIAsGJR1SA=;
	b=gDTpvuzFYar9ar+JkPU+OHz2c5v51kuWiqoeiebKy0nzo0KuZ0MbzNhs05Tu39WtQ1yK
	 wNMnSbi7EIzPN3OtMk3FuLxcp3cTJjude8t2I+ko1wbKTtPdEOb3jY1Kpy+RczsdCbOMZ
	 vq0dSeZaRfAvqEgpAK/jaPYzeA+0xErPExUYe1PaJwb6Ip6CZ5GtqVlQXQkl/9uuBdEcl
	 OeNQ8W0eIqCU1NFc6/+soSXKFOBLkz5SD4iQ8xfTuTOCwrVX1PEt5PfkESN3MMowBS0qb
	 KaJ3p5j4RNRySTXSXbQVS+REzEYiGQ1QwdOfbZVSYQLwGXJvLw+9QQsI9vFbBgk1wCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Amuu+Zi4;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC915606A31A;
	Mon, 23 Nov 2026 01:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC915606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Amuu+Zi4
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AN1dP6711204613, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795397965; bh=08ebP782mM89d57XiQanBzg+5eva9CillFIAsGJR1SA=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	b=Amuu+Zi4J4DoOXKuXKQQa3DqPbKu7bxCZR7fmwbXI68wdq3w/j7UmuC/3xYSrX+Rv
	 qhOBnEiKRm4Y58nVI5XdasoPwz8uMTJcnUEXUD4mgYBWT3sxm7iYO4ZEdy2kwFBlXd
	 n/fb5VSEe/172omVK/mVG+PvlekUQSH8IVtLHeq+ihoqgHPc9NWydzHicldFWEzdCa
	 bQMOeVL3aD/lIS6Lrw2vEz/xwpIZfTq2mk4wQ7Gfd2NibAxGQeyvP3CiLEefLcZeIO
	 FESwgtjTETmJpV4NeVdRbvOknsBIgPZy/q8qi9YBFZkwkmn8QnQJX0IuYX/aRKXwHL
	 QVYmCXS1IvTbA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AN1dP6711204613
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Nov 2026 09:39:25 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 09:39:25 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Mon, 23 Nov 2026 09:39:20 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Ahmet Zeren <niko3x@proton.me>, Jes Sorensen <Jes.Sorensen@gmail.com>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Ping-Ke
 Shih <pkshih@realtek.com>, Ahmet Zeren <niko3x@proton.me>
Subject: Re: [PATCH rtw-next v2 1/2] wifi: rtl8xxxu: don't report frames sent without ACK as acked
In-Reply-To: <20261122-b4-tx-status-v2-1-bbfdbd880acf@proton.me>
References: <20261122-b4-tx-status-v2-0-bbfdbd880acf@proton.me> <20261122-b4-tx-status-v2-1-bbfdbd880acf@proton.me>
Message-ID: <cabf3d42-5f1b-4c85-9d30-79b15b6cf024@RTKEXHMBS06.realtek.com.tw>
Date: Mon, 23 Nov 2026 09:39:20 +0800
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

Ahmet Zeren <niko3x@proton.me> wrote:

> From: Ahmet Zeren <niko3x@proton.me>
> 
> Every frame whose USB transfer succeeded is reported as acked, including
> those sent with IEEE80211_TX_CTL_NO_ACK. Report these as
> IEEE80211_TX_STAT_NOACK_TRANSMITTED instead.
> 
> Reviewed-by: Ping-Ke Shih <pkshih@realtek.com>
> Signed-off-by: Ahmet Zeren <niko3x@proton.me>

2 patch(es) applied to rtw-next branch of rtw.git, thanks.

badd0de98660 wifi: rtl8xxxu: don't report frames sent without ACK as acked
8b29fd95e2d3 wifi: rtl8xxxu: report real TX status on RTL8188CU/RTL8192CU

---
https://github.com/pkshih/rtw.git

