Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180227;
	b=ltJF21fFKVxvHA4AEfYV20jMDa6SDbhohaAEIOuPENyj/8m7iGeFRJSaYyocZBT4SyRG
	 NBZNZNov8K2QomHeenPIjY3+H6gzpMKnzXZzr2iQjUHJYo2d3/iV/mGpLjduTIYSxn1cP
	 SUAadDzflQtbagZmhkWhguvq7JALrRr43fr6Xhokv7WYULVCaI5avFmmeM7jtUoolrQr/
	 GBxFwEe2z0nJskBaaGTBSsUktG0Whp430ndBYS0uMFrk09cxYCZs0vokJU78N2R9TQlth
	 YJnGeWzuXb2j1bbM/lHL6r0zOSvXGRYuLXk65zAokEr170qnx2BAuXuEYn3dxXpKM/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180227;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:Content-Type:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xn1IO6yTvSHdprDu/FiOyBMJU5m8bDoeHEsv2AenIc4=;
	b=Sc4CIIqOP4HjsoxXv0yLeFpmoXg0nrIkuEzf2KZitQbAdS5lBcFUWwst9Jwj2HLFKcJZ
	 nSp0f/BViiW3Xj+29jEBzP1370gd4ReQtKyGlykWnAKleVvG9v8zyAzdx2C4U0dkxL0N9
	 hn/V26ppGXqfB+vy+xBBw+2LQIUu6rZBmJtLkbQ8llsfAZZIJaxJM2uF7E+KXrZdJd2sL
	 PxIcfnJr2iSbH8W580T2VcEhOnW9gD77InHiwc9VL/O6RUSNhbhFgn+VFMqvGYkJQ1D7O
	 shD+PxdIDWngIiOT3VI0aMazAVWHO0Lhnq0i3Eo284rKup+kHOmstoS/4i98JlgkGAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HWCRpDos;
	arc=none smtp.remote-ip=91.218.175.149
Received: from mta0.migadu.com (out-149.mta0.migadu.com [91.218.175.149])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4630A606A320
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 13:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4630A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HWCRpDos
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KoBbJloLNnkG9NTyYWoY5FE+8hjeV5tHp18rUKV63Mg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795180223; v=1; x=1795785023;
 b=HWCRpDosCNKt73U7lcvSyi4GbkJigFjgxoFm+/xWTLb9CqiTOlmxjHavc/n+Ri8XyWvGZUNz
 R+1qbsLJvw6sx1fKjwuivzap/x4K5iuQydKn1UDu14tvjNnjcULSsOjZIg6huoq/hlLdn1lPOfc
 aVG7Q9hpe7CfFvtzKfoPjtMI=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7a655038b72e5eef;
	Fri, 20 Nov 2026 13:10:20 +0000
X-Mizu-Trace-ID: 7a655038b72e5eef
X-Migadu-Flow: FLOW_OUT
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>,
	Ping-Ke Shih <pkshih@realtek.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v3 1/5] wifi: rtw88: free the reserved pages of an interface on firmware recovery
Date: Fri, 20 Nov 2026 14:09:16 +0100
Message-ID: <20261120131000.33858-1-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117171003.1840491-2-mehmet.fide@gmail.com>
References: <20261117171003.1840491-1-mehmet.fide@gmail.com> <20261117171003.1840491-2-mehmet.fide@gmail.com>
Content-Type: text/plain; charset="us-ascii"
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

Hi Mehmet,

Thanks for the update. Two comments below.

On November 17, 2026 6:09:59 PM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:

> @@ -1765,6 +1768,9 @@ int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev)
>  	u32 size;
>  	int ret;
>
> +	if (bitmap_empty(rtwdev->hw_port, RTW_PORT_NUM))
> +		return 0;
> +
>  	buf = rtw_build_rsvd_page(rtwdev, &size);

Could this skip a download that WoWLAN needs? If suspend flushes the
recovery work while it holds RTNL, ieee80211_restart_work() cannot add
the interfaces back before rtw_wow_suspend() runs. With net detect
configured, the station interface can still be picked for WoWLAN.
rtw_wow_leave_no_link_ps() can power the device back up without setting
the port bitmap again.

So rtw_wow_config_wow_fw_rsvd_page() adds the scan pages, but the check
above returns success before downloading them. rtw_wow_fw_start() then
tries to enable net detect with a zero page location for the NLO and
channel tables. Could we keep the skip in the beacon update paths, or
have suspend fall back to the normal suspend path when a restart is
pending?

[ ... ]

> @@ -633,6 +633,7 @@ static void rtw_reset_vif_iter(void *data, u8 *mac, struct ieee80211_vif *vif)
>  	rtw_bf_disassoc(rtwdev, vif, NULL);
>  	rtw_vif_assoc_changed(rtwvif, NULL);
>  	rtw_txq_cleanup(rtwdev, vif->txq);
> +	rtw_remove_rsvd_page(rtwdev, rtwvif);

I think the empty list warning can still happen with AP and station
interfaces on the RTL8822C. If a station interface comes up after the
reset clears the bitmap, rtw_ops_add_interface() sets a port before
ieee80211_do_open() marks the interface running. The AP still has an
empty list, and the page iterator skips the station interface until it
is running.

Can a TIM update from the AP run in that gap? For example, the station
cleanup timer can expire a buffered frame after rtw_core_stop() cancels
the beacon work. The worker can then see a port in use and still hit
"Should not have an empty reserved page". Would it make sense to free
the old pages before reinitializing the list when adding an interface
that was already initialized, as Zong-Zhe suggested?

https://lore.kernel.org/linux-wireless/96da951407ab4c39b7e229ca365950eb@realtek.com/

Best regards,
Luka Gejak
