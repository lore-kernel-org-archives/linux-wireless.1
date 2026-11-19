Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102455;
	b=2u83mOvEvWvib0ZtLOnWn/QBnijqEIDKo3mD3INu/mDMHNY5LG7KzagrPkpHR912iOws
	 jaQklMfR7zF18WKkVHtFAV1iSVN3CQ93sYcwMsruFrUoWnyrT6A2i1NwHiGiFjcpZyAL8
	 7pSZWPKSZ9GvjIbT/MEhSMkoNnR+cURXWJ6Vk/dMd2A64t68a47C0X+TWqvlAOcVPpdVO
	 F7860qZk341lKq993thFvJoM/BH50H2SNjEVgGneHBpO1bUFBTwYubqPvRcsOEe8eAQ8c
	 ofAX56ovR79OmOcdnWa/WMI1QW9s5YjSW+zjAjAmSDXRXOrPd9Q1MJNtFwObd3cMb3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102455;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-malware-bazaar;
	bh=3dMKvfDOqtYyEDsBf2/VAUyEsVF51Ta+iGPIRmde3PU=;
	b=lr1kvHH8MmxeyY3ZIlBQ4hZ2HqcGHUge+IzlRfREQPlvy53TBiH1YBt7jc0ggM9kk+1h
	 F/L0nE2/ZG9YR3BtmwTA9dwjgfgHQGEXMuc962Gq6j1YJqpk/0VRM7448io4i3YdssCPQ
	 N1hsOwzIauG661GyfmjchyMXKGSeI8Tg7SQJ0gjChhYxYKlc/WsMiN/BCKqYoFJwrLSJv
	 XJVU8cTF9NtEapXBPI0ZGbKN0rVFVuzSUMHtrBq9BTCivOmQERwOUeozeU4xWdclPs8kQ
	 cLLfNNsP0/YxgA/jtZXuFulFFXhUFCD2BxFCOtzNw4KQoZi4nytifdN5sQ9ru95hU7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=KNKgAVTN;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B91606A320;
	Thu, 19 Nov 2026 15:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=KNKgAVTN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=3dMKvfDOqtYyEDsBf2/VAUyEsVF51Ta+iGPIRmde3PU=; t=1795102454; x=1796312054; 
	b=KNKgAVTNzC7vKWoqvDSHqgdiNPnOKPtU9+V0olHFPzzFlPcHSylmG2VjU+sqQyg9cacUijohscy
	dnflAlGZa24kBBYXNxWEvbj/L5jA9i1QzenIxLWQmEw+Fg9ZfUhWAOLMpObqxdE5jWlJ7g8dMzJF6
	5EN1wof+FA5Zxtoma41/SlR07KOCH5wti4aOVcEDAZ++C5STVOVM5C6ZRTNBGXhXWlwg0n+2DljnR
	zenCuBvMnyeA/T94sKL6JlRs5dyD36zhj0QQnNJTUGaJpZ4XxVtXH7FJKwvFxZu7yikrs+pvChrZ+
	bnKmJBQwxu+8rp6cYBHugaz0iV4P/Pzb19mQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xU49M-00000004Ybt-2R7i;
	Thu, 19 Nov 2026 16:34:12 +0100
From: Johannes Berg <johannes@sipsolutions.net>
To: netdev@vger.kernel.org
Cc: linux-wireless@vger.kernel.org
Subject: [GIT PULL] wireless-2026-11-19
Date: Thu, 19 Nov 2026 16:33:27 +0100
Message-ID: <20261119153408.342115-3-johannes@sipsolutions.net>
X-Mailer: git-send-email 2.56.1
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
Content-Transfer-Encoding: 8bit
X-malware-bazaar: not-scanned

Hi,

A bit late, but nothing that's urgent or would need
to be resolved with net-next/wireless-next soon.
Just a couple of driver updates, still reviewing
more core changes.

Please pull and let us know if there's any problem.

Thanks,
johannes



The following changes since commit 7e1392a42ea288d70a266f6553fe06f57f8647ea:

  Merge tag 'net-7.4-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2026-11-12 12:26:14 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git tags/wireless-2026-11-19

for you to fetch changes up to 47f80fcddd09b68b2b0a619bcd5a0048ccc11714:

  Merge tag 'rtw-2026-11-19' of https://github.com/pkshih/rtw (2026-11-19 16:25:10 +0100)

----------------------------------------------------------------
Some driver fixes:
 - iwlwifi: regulatory/FW crash and VHT NSS
 - ath10k: revert a fix causing more trouble,
           fix TX completions
 - ath9k: fix beacons, tasklet teardown, build
 - rtw89: fix connection drop on RTL8851BE

----------------------------------------------------------------
Emmanuel Grumbach (3):
      wifi: iwlwifi: honor the per-channel 320 MHz regulatory flag
      wifi: iwlwifi: mvm: don't send LARI_CONFIG_CHANGE to old FW
      wifi: iwlwifi: mvm: fix VHT NSS reporting on pre-MQ devices

Felix K. (2):
      wifi: ath9k: fix beacon slot selection once TSF exceeds 2^39 us
      wifi: ath9k_htc: fix beacon slot selection once TSF exceeds 2^42 us

Hao Tan (1):
      wifi: rtw89: coex: Disable pre-AGC for out-of-band links

Jeff Johnson (1):
      Revert "wifi: ath10k: Stop unanswered temperature reads"

Johannes Berg (4):
      wifi: ath9k: uninline ar9003_paprd_create_curve() helpers
      Merge tag 'iwlwifi-fixes-2026-11-16' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next
      Merge tag 'ath-current-20261116' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath
      Merge tag 'rtw-2026-11-19' of https://github.com/pkshih/rtw

Miri Korenblit (2):
      wifi: iwlwifi: trans: don't memset trans::conf when it is still needed
      wifi: iwlwifi: mvm: correctly check the API version

Shunsuke Nagashima (1):
      wifi: ath10k: fix status of bundled mgmt tx completions

Toke Høiland-Jørgensen (1):
      wifi: ath9k: make sure we stop the wmi tasklet on init fail

 drivers/net/wireless/ath/ath10k/core.c             |  1 -
 drivers/net/wireless/ath/ath10k/thermal.c          |  9 +-------
 drivers/net/wireless/ath/ath10k/thermal.h          |  2 --
 drivers/net/wireless/ath/ath10k/wmi.c              |  2 +-
 drivers/net/wireless/ath/ath9k/ar9003_paprd.c      | 10 +++++----
 drivers/net/wireless/ath/ath9k/ath9k.h             |  3 ---
 drivers/net/wireless/ath/ath9k/beacon.c            | 10 ++++-----
 drivers/net/wireless/ath/ath9k/htc.h               |  2 --
 drivers/net/wireless/ath/ath9k/htc_drv_beacon.c    | 10 ++++-----
 drivers/net/wireless/ath/ath9k/wmi.c               |  5 ++++-
 drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c |  6 +++---
 drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.h |  7 +++++--
 drivers/net/wireless/intel/iwlwifi/iwl-trans.c     |  1 -
 drivers/net/wireless/intel/iwlwifi/mvm/fw.c        |  3 +++
 drivers/net/wireless/intel/iwlwifi/mvm/ops.c       | 12 +++++------
 drivers/net/wireless/intel/iwlwifi/mvm/rx.c        |  4 ++--
 .../net/wireless/intel/iwlwifi/tests/nvm_parse.c   | 24 ++++++++++++++++++----
 drivers/net/wireless/realtek/rtw89/coex.c          |  3 ++-
 18 files changed, 62 insertions(+), 52 deletions(-)
